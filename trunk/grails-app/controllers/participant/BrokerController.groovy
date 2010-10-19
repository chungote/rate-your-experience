package participant

import org.ronintech.StringUtil
import security.Person

class BrokerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def authenticateService
    def queryService
    def sessionFactory


    def index = {
        redirect(action: "list", params: params)
    }

    def listAdmin = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [brokerInstanceList: Broker.list(params), brokerInstanceTotal: Broker.count()]
    }

    def list = {

        if (!authenticateService.ifAnyGranted("ROLE_ADMIN") && !authenticateService.ifAnyGranted("ROLE_BROKER")) {
            flash.message = "You are not authorized to view this information"
        }
        //params.max = Math.min(params.max ? params.int('max') : 10, 100)
        if (!params.sort) {
            params.sort = "companyName"
            params.order = "asc"
        }

        [brokerInstanceList: Broker.list(params), brokerInstanceTotal: Broker.count()]

    }


    def editListSearch = {BrokerSearchCommand search ->
        //println "params:$params"
        //println "search:${search.dump()}"
        //def responseSearchInstance = new ResponseSearchCommand(params)
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

        params.companyName = search.companyName;


        if (search?.companyName) {

            render(template: "editList", model: [brokerInstanceList: findBrokers(search)])

        }
        else {
            render(template: "editList", model: [Broker.list(params)])
        }
    }
    def editList = {
        //params.max = Math.min(params.max ? params.int('max') : 10, 100)
        if (!params.sort) {
            params.sort = "companyName"
            params.order = "asc"
        }
        [brokerInstanceList: Broker.list(params), brokerInstanceTotal: Broker.count()]
    }

/*
    def create = {
        def brokerInstance = new Broker()
        brokerInstance.properties = params
        return [brokerInstance: brokerInstance]
    }

    def save = {
        def brokerInstance = new Broker(params)
        if (brokerInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'broker.label', default: 'Broker'), brokerInstance.id])}"
            redirect(action: "show", id: brokerInstance.id)
        }
        else {
            render(view: "create", model: [brokerInstance: brokerInstance])
        }
    }
*/
    def show = {
        if (!authenticateService.ifAnyGranted("ROLE_ADMIN") && !authenticateService.ifAnyGranted("ROLE_BROKER")) {
            redirect(action: "list")
        }

        def brokerInstance = Broker.get(params.id)

        if (authenticateService.ifAnyGranted("ROLE_BROKER")) {
            Person user = authenticateService.userDomain()
            brokerInstance = user.getParticipant()
        }

        if (!brokerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'broker.label', default: 'Broker'), params.id])}"
            redirect(action: "list")
        }
        else {

            return [brokerInstance: brokerInstance,
                    surveyInvitationRequestInstanceList: brokerInstance.surveyInvitationRequests?.sort {a, b -> if (a?.lastUpdated == null) { return 1} else {return -(a?.lastUpdated?.compareTo(b?.lastUpdated))}},
                    listingInstanceList: brokerInstance.sellerListings?.sort {a, b -> if (a?.closedDate == null) { return 1} else {return -(a?.closedDate?.compareTo(b?.closedDate))}},
                    agentInstanceList: brokerInstance.agents,
                    surveyResponseInstanceList: brokerInstance.responses?.sort {a, b -> if (a?.lastUpdated == null) { return 1} else {return -(a?.lastUpdated?.compareTo(b?.lastUpdated))}}]
        }
    }

    def edit = {
        if (!authenticateService.ifAnyGranted("ROLE_ADMIN") && !authenticateService.ifAnyGranted("ROLE_BROKER")) {
            redirect(action: "list")
        }

        def brokerInstance = Broker.get(params.id)
        if (authenticateService.ifAnyGranted("ROLE_BROKER")) {
            Person user = authenticateService.userDomain()
            brokerInstance = user.getParticipant()
        }
        if (!brokerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'broker.label', default: 'Broker'), params.id])}"
            redirect(action: "editList")
        }
        else {
            return [brokerInstance: brokerInstance]
        }
    }

    def update = {
        if (!authenticateService.ifAnyGranted("ROLE_ADMIN") && !authenticateService.ifAnyGranted("ROLE_BROKER")) {
            redirect(action: "list")
        }
        def brokerInstance = Broker.get(params.id)

        if (authenticateService.ifAnyGranted("ROLE_BROKER")) {
            Person user = authenticateService.userDomain()
            brokerInstance = user.getParticipant()
        }
        if (brokerInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (brokerInstance.version > version) {

                    brokerInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'broker.label', default: 'Broker')] as Object[], "Another user has updated this Broker while you were editing")
                    render(view: "edit", model: [brokerInstance: brokerInstance])
                    return
                }
            }
            brokerInstance.properties = params
            if (params.userRealName != null) {
                Person responder = Person.findByUserRealName(params.userRealName)
                brokerInstance.centralizedResponder = responder
            }
            if (!brokerInstance.hasErrors() && brokerInstance.save(flush: true)) {
                List agentInstanceList = brokerInstance.agents
                agentInstanceList.each() {
                    def agent = Agent.get(it.id)
                    agent.optInRatings = brokerInstance.optInRatings
                    agent.optInPublicDisplay = brokerInstance.optInPublicDisplay
                    agent.enabled = brokerInstance.enabled
                    agent.save(flush: true)
                }
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'broker.label', default: 'Broker'), brokerInstance.id])}"
                redirect(action: "edit", id: brokerInstance.id)
            }
            else {
                render(view: "edit", model: [brokerInstance: brokerInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'broker.label', default: 'Broker'), params.id])}"
            redirect(action: "editList")
        }
    }
/*
    def delete = {
        def brokerInstance = Broker.get(params.id)
        if (brokerInstance) {
            try {
                brokerInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'broker.label', default: 'Broker'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'broker.label', default: 'Broker'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'broker.label', default: 'Broker'), params.id])}"
            redirect(action: "list")
        }
    }
    */
    def search = {
        if (!authenticateService.ifAnyGranted("ROLE_ADMIN")) {
            flash.message = "You do not have authority to search other brokers' information"
            redirect(action: "list")
        }

        def brokerSearchInstance = new BrokerSearchCommand()
        //responseSearchInstance.properties = params
        return [brokerSearchInstance: brokerSearchInstance]
    }

    def doSearch = {BrokerSearchCommand search ->
        //println "params:$params"
        //println "search:${search.dump()}"
        //def responseSearchInstance = new ResponseSearchCommand(params)
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

        params.companyName = search.companyName;


        if (search?.companyName) {
            render(template: "list", model: [brokerInstanceList: findBrokers(search)])
        }
        else {
            render(template: "list", model: [Broker.list(params)])
        }
    }

    def agentRatingChart = {
        def broker = Integer.valueOf(params.id)
        def chartValue = params.chartValue ?: "Average"
        def ret = getPercentsForBroker(broker, 'agent', chartValue)

        def questionTypes = queryService.findAllQuestionTypes("agent")

        def titleText = "Your ${chartValue} Ratings-${params?.questionType ?: 'Overall'}"

        if (params?.beginDate) {
            titleText += " from ${params?.beginDate.format('MM/dd/yy')}"
        }
        if (params?.endDate) {
            titleText += " thru ${params?.endDate.format('MM/dd/yy')}"
        }

        return [
                broker: broker,
                beginDate: params.beginDate,
                endDate: params.endDate,
                questionType: params?.questionType ?: "",
                chartValue: chartValue,
                questionTypeList: questionTypes,
                chartValueList: ["Average", "Low"],

                //chart: [
                title: titleText.toString(),
                columns: [['string', 'Stars'], ['number', 'Your Ratings %'], ['number', 'All Ratings %']],
                data: [
                        ['1 star', ret.myPercents[0], ret.allPercents[0]],
                        ['2 stars', ret.myPercents[1], ret.allPercents[1]],
                        ['3 stars', ret.myPercents[2], ret.allPercents[2]],
                        ['4 stars', ret.myPercents[3], ret.allPercents[3]],
                        ['5 stars', ret.myPercents[4], ret.allPercents[4]]
                ]
                //]
        ]
    }

    def serviceProviderRatingChart = {
        def broker = Integer.valueOf(params.id)
        def chartValue = params.chartValue ?: "Average"
        def providerType = params?.providerType ?: "all providers"

        def ret = getPercentsForBroker(broker, providerType, chartValue)

        def questionTypes = queryService.findAllQuestionTypes(providerType)
        def providerTypes = queryService.findAllServiceProviderTypes().collect {StringUtil.properCase(it)}

        def titleText = "${StringUtil.properCase(providerType)} ${chartValue} Ratings-${params?.questionType ?: 'Overall'}"

        if (params?.beginDate) {
            titleText += " from ${params?.beginDate.format('MM/dd/yy')}"
        }
        if (params?.endDate) {
            titleText += " thru ${params?.endDate.format('MM/dd/yy')}"
        }

        def model = [
                broker: broker,
                beginDate: params?.beginDate,
                endDate: params?.endDate,
                questionType: params?.questionType ?: "",
                providerType: params?.providerType ?: "",
                chartValue: chartValue,
                questionTypeList: questionTypes,
                providerTypeList: providerTypes,
                chartValueList: ["Average", "Low"],

                title: titleText.toString(),
                columns: [['string', 'Stars'], ['number', 'Your Ratings %'], ['number', 'All Ratings %']],
                data: [
                        ['1 star', ret.myPercents[0], ret.allPercents[0]],
                        ['2 stars', ret.myPercents[1], ret.allPercents[1]],
                        ['3 stars', ret.myPercents[2], ret.allPercents[2]],
                        ['4 stars', ret.myPercents[3], ret.allPercents[3]],
                        ['5 stars', ret.myPercents[4], ret.allPercents[4]]
                ]
        ]
        // println "model=${model.dump()}"
        return model
    }



    private LinkedHashMap<String, List> getPercentsForBroker(broker, type, chartValue) {

        def func = 'avg'
        if (chartValue.toLowerCase() == 'low') {
            func = 'min'
        }
        def queryString = queryService.findBrokerQuery(type, params, [func: func])

        def hSession = sessionFactory.getCurrentSession()
        def query = hSession.createSQLQuery(queryString).
                addScalar("rating").
                addScalar("bid").
                addScalar("id")
        def pos = 0
        if (params.beginDate && params.endDate) {
            // "and n.survey_completed_date between ? and ?"
            query.setDate(pos++, params.beginDate)
            query.setDate(pos++, params.endDate)
        }
        else if (params.beginDate) {
            //"and n.survey_completed_date >= ?"
            query.setDate(pos++, params.beginDate)
        }
        else if (params.endDate) {
            // "and n.survey_completed_date <= ?"
            query.setDate(pos++, params.endDate)
        }

        if (params.questionType) {
            // "and q.header = ?"
            query.setString(pos++, params.questionType)
        }

        def results = query.list()

        def allCounts = [:]
        def allTotalCount = 0
        def myCounts = [:]
        def myTotalCount = 0
        //println "results=${results}"
        results.each() {row ->
            if (row[0]) { // if there is a non-null rating
                def bin = mapToBin(row[0])
                allCounts.put(bin, 1 + (allCounts.get(bin, 0)))
                allTotalCount++
                if (row[1] == broker) {
                    myCounts.put(bin, 1 + (myCounts.get(bin, 0)))
                    myTotalCount++
                }

            }
        }
        def myPercents = []
        def allPercents = []

        // convert to percents
        1.upto(5) { i ->
            myPercents[i - 1] = 0
            allPercents[i - 1] = 0
            if (myTotalCount) { // don't div by zero
                myPercents[i - 1] = (myCounts.get(i.toString(), 0.0) * 100.0 / myTotalCount).toInteger()
            }
            if (allTotalCount) {// don't div by zero
                allPercents[i - 1] = (allCounts.get(i.toString(), 0.0) * 100.0 / allTotalCount).toInteger()
            }
        }

        return [myPercents: myPercents, allPercents: allPercents]
    }

    String mapToBin(rating) {

        return (rating + 0.5).toInteger().toString()
    }


    def findBrokers(BrokerSearchCommand search) {
        def crit = Broker.createCriteria()
        def brokers = crit {
            and {
                if (search?.companyName) {

                    ilike('companyName', search.companyName + "%")
                }
            }

        }


        return brokers.sort {it.companyName}
    }

    def searchAJAXUsers = {
        def field = "userRealName"



        def ajaxResults = Person.createCriteria().list(max: 10, sort: field, order: "asc") {
            Person user = authenticateService.userDomain()

            and {
                ilike(field, "${params.query}%")

                if (authenticateService.ifAnyGranted("ROLE_BROKER")) {

                    def inList = user.getParticipant().agents.id*.toInteger()
                    inList << user.getParticipant().id.toInteger()

                    'in'('participantId', inList)
                }
            }
        }


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
}

class BrokerSearchCommand {

    static constraints = {
        companyName(nullable: true)
        city(nullable: true)

    }

    String companyName
    String city

}

