package survey

import notification.Notification
import participant.Agent
import participant.Broker
import participant.Office
import participant.ServiceProvider
import security.Person
import system.Hash
import transaction.Listing

class SurveyResponseController {

    def notificationFlowService
    def simpleProfanityFilterService
    def authenticateService
    def dataAccessService
    def notificationStatisticsService
    def serviceProviderService
    def sessionFactory

    def index = {
        redirect(action: "search", params: params)
    }

    def pendingApprovalList = {
        //params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def surveyResponseList = []
        Person user = authenticateService.userDomain()
        def notificationList = notificationStatisticsService.getReviewPendingList(user)

        notificationList.each() {
            def surveyResponse = SurveyResponse.get(it)
            if (surveyResponse != null) {
                surveyResponseList << surveyResponse
            }
        }

        [surveyResponseInstanceList: surveyResponseList]
    }

    def flaggedReviewList = {
        //params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def surveyResponseList = []
        Person user = authenticateService.userDomain()
        def notificationList = notificationStatisticsService.getFlaggedReviewList(user)

        notificationList.each() {

            def surveyResponse = SurveyResponse.get(it)
            if (surveyResponse != null) {

                surveyResponseList << surveyResponse
            }
        }

        [surveyResponseInstanceList: surveyResponseList]
    }

    def list = {
        //params.max = Math.min(params.max ? params.int('max') : 10, 100)

        [surveyResponseInstanceList: SurveyResponse.list(params), surveyResponseInstanceTotal: SurveyResponse.count()]
    }

    def report = {
        if (!params.max) params.max = 10
        Person user = authenticateService.userDomain()
        Agent agent = Agent.findByMlsAgentId(params.id)
        if (authenticateService.ifAnyGranted("ROLE_AGENT")) {
            agent = user.getParticipant()
        }

        if (!dataAccessService.isMyAgent(agent, user)) {
            flash.message = "You are not authorized to view survey responses for this member"
            redirect(action: "search")
        }

        [surveyResponseInstanceList: agent.responses, surveyResponseInstanceTotal: SurveyResponse.count(), agentInstance: Agent.findByMlsAgentId(params.id)]
    }

    def brokerReport = {

        if (!authenticateService.ifAnyGranted("ROLE_ADMIN") && !authenticateService.ifAnyGranted("ROLE_BROKER")) {
            flash.message = "You are not authorized to view survey responses for a broker"
            redirect(action: "search")
        }

        if (!params.max) params.max = 10
        Person user = authenticateService.userDomain()
        Broker broker = Broker.get(params.id)

        if (authenticateService.ifAnyGranted("ROLE_BROKER")) {
            broker = user.getParticipant()
        }

        [surveyResponseInstanceList: broker.responses, surveyResponseInstanceTotal: SurveyResponse.count(), brokerInstance: Broker.get(params.id)]
    }

    def brokerRebuttalList = {

        if (!authenticateService.ifAnyGranted("ROLE_ADMIN") && !authenticateService.ifAnyGranted("ROLE_BROKER")) {
            flash.message = "You are not authorized to view survey responses for a broker"
            redirect(action: "search")
        }

        if (!params.max) params.max = 10
        Person user = authenticateService.userDomain()
        Broker broker = Broker.get(params.id)

        if (authenticateService.ifAnyGranted("ROLE_BROKER")) {
            broker = user.getParticipant()
        }

        [listingInstanceList: broker.sellerListings, brokerInstance: broker]
    }

    def create = {
        def surveyResponseInstance = new SurveyResponse()
        def notificationId = Hash.findByCode(params.id)?.value?.toLong()
        //println "params.id=$params.id notificationId=$notificationId"
        def notificationInstance = Notification.get(notificationId)

        if (notificationInstance.surveyCompletedDate) {
            // survey response already completed
            render(view: "thankYou", model: [message: "This Survey Response was already completed on ${notificationInstance.surveyCompletedDate}"])
        }
        surveyResponseInstance.survey = Survey.get(notificationInstance?.surveyInvitationRequest?.survey?.id)
        surveyResponseInstance.notification = notificationInstance

        if (surveyResponseInstance.survey) {

            //['demographic', 'agent', 'attorney', 'house inspector', 'lender', 'mold inspector', 'radon inspector', 'termite inspector']
            def serviceProviderList = surveyResponseInstance?.survey?.groups?.findAll {it.questions}?.type
            def serviceProviderDefault = 'agent'
            return [
                    surveyResponseInstance: surveyResponseInstance,
                    surveyInvitationRequestInstance: notificationInstance.surveyInvitationRequest,
                    serviceProviderList: serviceProviderList,
                    serviceProviderDefault: serviceProviderDefault
            ]
        }
        else {
            render "Invalid URL"
        }
    }

    def preview = {
        def surveyResponseInstance = new SurveyResponse()

        surveyResponseInstance.survey = Survey.get(params.id)

        if (surveyResponseInstance.survey) {
            def serviceProviderList = surveyResponseInstance?.survey?.groups?.findAll {it.questions}?.type
            def serviceProviderDefault = 'agent'
            return [
                    surveyResponseInstance: surveyResponseInstance,
                    serviceProviderList: serviceProviderList,
                    serviceProviderDefault: serviceProviderDefault
            ]
        }
        else {
            render "invalid survey id [${params.id}]"
        }
    }

    def save = {
        //println params.inspect()
        def notificationInstance = Notification.get(params.notificationId)
        def surveyResponseInstance = new SurveyResponse(params)
        surveyResponseInstance.rebuttalFiltered = false
        //println notificationInstance.dump()
        notificationInstance.surveyResponse = surveyResponseInstance

        surveyResponseInstance.survey = Survey.get(notificationInstance?.surveyInvitationRequest?.survey?.id)

        ["lender", "houseInspector", "radonInspector", "termiteInspector", "moldInspector"].each { serviceProviderName ->
            if (params.surveyInvitationRequest[serviceProviderName].id
                    && notificationInstance.surveyInvitationRequest[serviceProviderName].id != params.surveyInvitationRequest[serviceProviderName].id.toLong()) {
                def newServiceProvider = ServiceProvider.get(params.surveyInvitationRequest[serviceProviderName].id)
                println "replacing ${notificationInstance.surveyInvitationRequest[serviceProviderName]}:${notificationInstance.surveyInvitationRequest[serviceProviderName]} with ${newServiceProvider}:${newServiceProvider.id}"
                notificationInstance.surveyInvitationRequest[serviceProviderName] = newServiceProvider
            }
        }

        int ratingSum = 0
        int ratingCount = 0
        params.each {k, v ->
            if (k.startsWith("question_")) {
                def arr = k.split('_')
                if (arr.size() >= 2) {
                    def qId = arr[1]
                    def result = simpleProfanityFilterService.evaluateContents(v)
                    def prop = [
                            question: Question.get(qId),
                            rating: params["rating_$qId"]
                    ]
                    if (result.error) {
                        prop.textFiltered = false
                        prop.profaneText = v
                    }
                    else if (result.isProfanity) {
                        prop.textFiltered = true
                        prop.profaneText = v
                        prop.text = result.cleanText
                    }
                    else {
                        prop.textFiltered = true
                        prop.text = v
                    }

                    def qResponse = new QuestionResponse(prop)
                    //println "qResponse:$k:$qResponse.properties"
                    surveyResponseInstance.addToResponses(qResponse)

                    if (prop.question.rateable) {
                        if (prop.rating) { // null || "" || 0 count as zero
                            ratingSum += Integer.valueOf(prop.rating)
                        }
                        ratingCount++
                    }
                }
            }
        }

        surveyResponseInstance.ratingAverage = (ratingSum + 0.0) / ratingCount

        if (notificationInstance.save(flush: true)) {

            notificationFlowService.clientCompletesSurveyEvent(notificationInstance)

            flash.message = "${message(code: 'default.created.message', args: [message(code: 'surveyResponse.label', default: 'SurveyResponse'), surveyResponseInstance.id])}"
            redirect(action: "thankYou", id: params.surveyId)
        }
        else {
            def serviceProviderList = surveyResponseInstance?.survey?.groups?.findAll {it.questions}?.type
            def serviceProviderDefault = 'agent'
            render(view: "create", model: [
                    surveyResponseInstance: surveyResponseInstance,
                    serviceProviderList: serviceProviderList,
                    serviceProviderDefault: serviceProviderDefault
            ])
        }
    }

    def show = {
        def surveyResponseInstance = SurveyResponse.get(params.id)
        if (!surveyResponseInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: '''surveyResponse.label''', default: 'SurveyResponse'), params.id])}"
            render(view: "error")
        }
        else {
            Person user = authenticateService.userDomain()
            if (!authenticateService.ifAnyGranted("ROLE_ADMIN") && !dataAccessService.isMyResponse(surveyResponseInstance, user)) {
                flash.message = "You are not authorized to view this survey response"
                [surveyResponseInstance: surveyResponseInstance]
                redirect(action: "search")
            }
            //['demographic', 'agent', 'attorney', 'house inspector', 'lender', 'mold inspector', 'radon inspector', 'termite inspector']
            def serviceProviderList = surveyResponseInstance?.survey?.groups?.findAll {it.questions}?.type
            def serviceProviderDefault = 'agent'
            return [
                    surveyResponseInstance: surveyResponseInstance,
                    serviceProviderList: serviceProviderList,
                    serviceProviderDefault: serviceProviderDefault
            ]
        }
    }

    def edit = {
        def surveyResponseInstance = SurveyResponse.get(params.id)
        if (!surveyResponseInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'surveyResponse.label', default: 'SurveyResponse'), params.id])}"
            redirect(action: "search")
        }
        else {
            Person user = authenticateService.userDomain()
            if (!dataAccessService.isMyResponse(surveyResponseInstance, user)) {
                flash.message = "You are not authorized to view this survey response"
                redirect(action: "search")
            }
            //['demographic', 'agent', 'attorney', 'house inspector', 'lender', 'mold inspector', 'radon inspector', 'termite inspector']
            def serviceProviderList = surveyResponseInstance?.survey?.groups?.findAll {it.questions}?.type
            def serviceProviderDefault = 'agent'
            return [
                    surveyResponseInstance: surveyResponseInstance,
                    serviceProviderList: serviceProviderList,
                    serviceProviderDefault: serviceProviderDefault
            ]
        }
    }

    def update = {

        def surveyResponseInstance = SurveyResponse.get(params.id)
        if (!surveyResponseInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'surveyResponse.label', default: 'SurveyResponse'), params.id])}"
            redirect(action: "search")
        }
        if (params.version) {
            def version = params.version.toLong()
            if (surveyResponseInstance.version > version) {

                surveyResponseInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'surveyResponse.label', default: 'SurveyResponse')] as Object[], "Another user has updated this SurveyResponse while you were editing")
                render(view: "edit", model: [surveyResponseInstance: surveyResponseInstance])
                return
            }
        }
        Person user = authenticateService.userDomain()
        if (!dataAccessService.isMyResponse(surveyResponseInstance, user)) {

            flash.message = "You are not authorized to update this survey response"
            redirect(action: "search")
        }

        surveyResponseInstance.properties = params

        params.each {k, v ->
            if (k.startsWith("text_")) {
                def arr = k.split('_')
                if (arr.size() >= 2) {
                    def qId = arr[1]
                    def result = simpleProfanityFilterService.evaluateContents(v)
                    def qResponse = QuestionResponse.get(qId)


                    if (result.error) {
                        qResponse.textFiltered = false
                        qResponse.profaneText = v
                    }
                    else if (result.isProfanity) {
                        qResponse.textFiltered = true
                        qResponse.profaneText = v
                        qResponse.text = result.cleanText
                    }
                    else {
                        qResponse.textFiltered = true
                        qResponse.text = v
                    }

                }
            }

        }

        if (params.rebuttal) {

            def result = simpleProfanityFilterService.evaluateContents(params.rebuttal)

            if (result.error) {
                surveyResponseInstance.rebuttalFiltered = false
                surveyResponseInstance.profaneRebuttal = params.rebuttal
            }
            else if (result.isProfanity) {
                surveyResponseInstance.rebuttalFiltered = true
                surveyResponseInstance.profaneRebuttal = params.rebuttal
                surveyResponseInstance.rebuttal = result.cleanText
            }
            else {
                surveyResponseInstance.rebuttalFiltered = true
                surveyResponseInstance.rebuttal = params.rebuttal
            }
        }

        if (!surveyResponseInstance.hasErrors() && surveyResponseInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.updated.message', args: [message(code: 'surveyResponse.label', default: 'SurveyResponse'), surveyResponseInstance.id])}"
            redirect(action: "show", id: surveyResponseInstance.id)
        }
        else {
            flash.message = "errors occurred"
            def serviceProviderList = surveyResponseInstance?.survey?.groups?.findAll {it.questions}?.type
            def serviceProviderDefault = 'agent'
            render(view: "edit", model: [
                    surveyResponseInstance: surveyResponseInstance,
                    serviceProviderList: serviceProviderList,
                    serviceProviderDefault: serviceProviderDefault
            ])
        }
    }
/*
    def delete = {

        if (!authenticateService.ifAnyGranted("ROLE_ADMIN")) {
            flash.message = "You are not authorized to edit this survey invitation request"
            redirect(action: "list")
        }
        def surveyResponseInstance = SurveyResponse.get(params.id)
        if (surveyResponseInstance) {
            try {
                surveyResponseInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'surveyResponse.label', default: 'SurveyResponse'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'surveyResponse.label', default: 'SurveyResponse'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'surveyResponse.label', default: 'SurveyResponse'), params.id])}"
            redirect(action: "list")
        }
    }
*/
    def thankYou = {
        [message: "${Survey.get(params.id).thankYou}"]
    }

    def clientCompletesSurveyEvent = {
        def notificationInstance = Notification.get(params.notificationId)
        notificationFlowService.clientCompletesSurveyEvent(notificationInstance)
        flash.message = "Completed Survey Message Sent to Agent and Admin"
        redirect(action: "show", id: params.id)
    }

    def adminReviewedSurveyResponseEvent = {
        def notificationInstance = Notification.get(params.notificationId)
        notificationFlowService.adminReviewedSurveyResponseEvent(notificationInstance)
        flash.message = "Survey Approved"
        redirect(action: "show", id: params.id)

    }

    def search = {
        def responseSearchInstance = new ResponseSearchCommand()
        //responseSearchInstance.properties = params
        return [responseSearchInstance: responseSearchInstance]
    }

    def doSearch = {ResponseSearchCommand search ->
        println "params:$params"
        //println "search:${search.dump()}"
        //def responseSearchInstance = new ResponseSearchCommand(params)
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

        params.beginClosingDate = search.beginClosingDate;
        params.endClosingDate = search.endClosingDate;

        if (true /*!search.hasErrors()*/) {
            def myList = findResponses(params)
            def myTotal = myList.size()

            render(view: "list", model: [surveyResponseInstanceList: myList, surveyResponseInstanceTotal: myTotal])
        }
        else {
            render(view: "search", model: [responseSearchInstance: search])
        }
    }

    def searchAJAXStreetAddress = {
        def field = "streetAddress"

        println params.dump()

        //def listings = Listing.findAllByStreetAddressIlike("%${params.query}%", [max: 10, sort: "streetAddress", order: "asc"])
        def ajaxResults = Listing.createCriteria().list(max: 10, sort: field, order: "asc") {
            Person user = authenticateService.userDomain()
            and {
                ilike(field, "%${params.query}%")
                if (authenticateService.ifAnyGranted("ROLE_AGENT")) {
                    eq('sellingAgentMlsId', user.getParticipant().mlsAgentId)
                }
                if (authenticateService.ifAnyGranted("ROLE_BROKER")) {
                    'in'('sellingAgentMlsId', user.getParticipant().agents.mlsAgentId)
                }
            }
        }
        println ajaxResults.inspect()

        renderAjaxResults(ajaxResults, field)
    }
    def searchAJAXOffice = {
        def field = "officeName"

        println params.dump()

        def ajaxResults = Office.createCriteria().list(max: 10, sort: field, order: "asc") {
            Person user = authenticateService.userDomain()
            and {
                ilike(field, "${params.query}%")

                if (authenticateService.ifAnyGranted("ROLE_BROKER")) {
                    eq('mlsMainOfficeId', user.getParticipant().mlsMainOfficeId)
                }

                if (authenticateService.ifAnyGranted("ROLE_AGENT")) {
                    eq('mlsOfficeId', user.getParticipant.mlsOfficeId)
                }

            }
        }
        println ajaxResults.inspect()

        renderAjaxResults(ajaxResults, field)
    }

    def searchAJAXAgent = {
        def field = "lookupName"

        println params.dump()

        def ajaxResults = Agent.createCriteria().list(max: 10, sort: field, order: "asc") {
            Person user = authenticateService.userDomain()
            and {
                ilike(field, "%${params.query}%")
                if (authenticateService.ifAnyGranted("ROLE_BROKER")) {
                    eq('mlsMainOfficeId', user.getParticipant().mlsMainOfficeId)
                }

                if (authenticateService.ifAnyGranted("ROLE_AGENT")) {
                    eq('id', user.getParticipant.id)
                }

            }
        }
        println ajaxResults.inspect()

        renderAjaxResults(ajaxResults, field)
    }

    def searchAJAXServiceProvider = {
        def field = "lookupName"

        println params.dump()

        def ajaxResults = ServiceProvider.createCriteria().list(max: 10, sort: field, order: "asc") {
            ilike(field, "%${params.query}%")
        }
        println ajaxResults.inspect()

        renderAjaxResults(ajaxResults, field)
    }

    def renderAjaxResults(ajaxResults, field) {
        //Create XML response
        render(contentType: "text/xml") {
            results {
                ajaxResults.each { row ->
                    result {
                        name(row[field])
                        //Optional id which will be available in onItemSelect
                        id(row.id)
                    }
                }
            }
        }
    }

    def findResponses(def search) {
        def listings = []

        if (search.streetAddress || search.mlsNumber || search.agents || search.offices || search.beginClosingDate || search.endClosingDate) {
            listings = Listing.createCriteria().list {
                Person user = authenticateService.userDomain()


                and {
                    if (authenticateService.ifAnyGranted("ROLE_AGENT")) {
                        eq('sellingAgentMlsId', user.getParticipant().mlsAgentId)
                    }
                    if (authenticateService.ifAnyGranted("ROLE_BROKER")) {
                        'in'('sellingAgentMlsId', user.getParticipant().agents.mlsAgentId)
                    }
                    if (search?.streetAddress) {
                        or {
                            search.streetAddress.split("\\|").each {
//println "streetAddress:${it.trim()}"
                                eq('streetAddress', it.trim())
                            }
                        }
                    }

                    if (search?.mlsNumber) {
                        eq('mlsNumber', search.mlsNumber)
                    }

                    if (search?.agents) {
                        or {
                            search.agents.split("\\|").each {
                                Agent.findAllByLookupName(it.trim()).each {
                                    eq('sellingAgentMlsId', it.mlsAgentId)
                                }
                            }
                        }
                    }
                    if (search?.offices) {
                        or {
                            search.offices.split("\\|").each {
                                Office.findAllByOfficeName(it.trim()).each {
                                    eq('sellingOfficeMlsId', it.mlsOfficeId)
                                }
                            }
                        }
                    }
                    if (search?.beginClosingDate) {
                        ge('closedDate', search.beginClosingDate)
                    }
                    if (search?.endClosingDate) {
                        le('closedDate', search.endClosingDate + 1)
                    }
                }
            } // listings
        }

        def notifications = []
        Person user = authenticateService.userDomain()
        if ((search.past30Days || search.serviceProviders) && (authenticateService.ifAnyGranted("ROLE_ADMIN") || user.getParticipant().notifications.id)) {
            notifications = Notification.createCriteria().list {


                and {
                    if (authenticateService.ifAnyGranted("ROLE_AGENT")) {

                        'in'('id', user.getParticipant().notifications.id)
                    }
                    if (authenticateService.ifAnyGranted("ROLE_BROKER")) {
                        'in'('id', user.getParticipant().notifications.id)
                    }
                    if (search?.past30Days) {
                        between('surveyRequestedDate', new Date() - 30, new Date())
                    }

                    if (search?.serviceProviders) {
                        or {
                            search.serviceProviders.split("\\|").each { lookup ->
                                ServiceProvider.findAllByLookupName(lookup.trim()).id.each {
                                    surveyInvitationRequest {
                                        eq('lender', it)
                                        eq('houseInspector', it)
                                        eq('radonInspector', it)
                                        eq('termiteInspector', it)
                                        eq('moldInspector', it)
                                        eq('attorney', it)
                                    }
                                }
                            }
                        } // or
                    }

                } // and
            }
        }

        println "listings.responses:${listings?.responses?.dump()}"
        println "notifications.surveyResponse:${notifications?.surveyResponse?.dump()}"

        def responses = [] as Set
        responses.addAll(listings?.responses?.flatten())
        responses.addAll(notifications?.surveyResponse?.flatten())

        def ret = responses.grep {it}.sort {it?.id}

        return ret
    }


}

class ResponseSearchCommand {

    static constraints = {
//    listings(nullable: true)
        mlsNumber(nullable: true)
//    offices(nullable: true)
//    agents(nullable: true)
        beginClosingDate(nullable: true, blank: true)
        endClosingDate(nullable: true, blank: true)
        past30Days(nullable: true)
        serviceProviders(nullable: true)
    }
//  List<Listing> listings
    String streetAddress
    String mlsNumber
//  List<Office> offices
    String offices
//  List<Agent> agents
    String agents
    Date beginClosingDate
    Date endClosingDate
    boolean past30Days
//  List<ServiceProvider> serviceProviders
    String serviceProviders

//  static transients = ['ListingList', 'officeList', 'agentList', 'serviceProviderList']

//  def getListingList() {
//    Listing.list().sort {it.streetAddress}
//  }

//  def getOfficeList() {
//    Office.list().sort {it.toString()}
//  }

//  def getAgentList() {
//    Agent.list().sort {it.toString()}
//  }

//  def getServiceProviderList() {
//    ServiceProvider.list().sort {it.toString()}
//  }


    String toString() {
        "${this.class.name} $id"
    }

}

