package notification

import participant.Agent
import participant.Broker
import participant.ServiceProvider
import security.Person

class SurveyInvitationRequestController {

    def notificationFlowService
    def authenticateService
    def dataAccessService
    def notificationStatisticsService
    def serviceProviderService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        //params.max = Math.min(params.max ? params.int('max') : 10, 100)
        if (!params.sort) {
            params.sort = "lastUpdated"
            params.order = "desc"
        }
        [surveyInvitationRequestInstanceList: SurveyInvitationRequest.list(params), surveyInvitationRequestInstanceTotal: SurveyInvitationRequest.count()]
    }

    def nonResponderList = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        if (!params.sort) {
            params.sort = "lastUpdated"
            params.order = "desc"
        }
        Person user = authenticateService.userDomain()

        def surveyInvitationRequestList = []
        def notificationList = notificationStatisticsService.getInformationRequestPendingList(user)
        notificationList.each() {
            def surveyInvitationRequest = SurveyInvitationRequest.get(id)
            if (surveyInvitationRequest != null) {
                surveyInvitationRequestList << surveyInvitationRequest
            }

        }

        [surveyInvitationRequestInstanceList: surveyInvitationRequestList]
    }

    def incompleteSurveyList = {
        //params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def surveyInvitationRequestList = []
        Person user = authenticateService.userDomain()
        def notificationList = notificationStatisticsService.getSurveyPendingList(user)

        notificationList.each() {
            def surveyInvitationRequest = SurveyInvitationRequest.get(it)
            if (surveyInvitationRequest != null) {
                surveyInvitationRequestList << surveyInvitationRequest
            }
        }
        [surveyInvitationRequestInstanceList: surveyInvitationRequestList]

    }



    def report = {
        if (!params.max) params.max = 10
        [surveyInvitationRequestInstanceList: Agent.findByMlsAgentId(params.id).surveyInvitationRequests, surveyInvitationRequestInstanceTotal: SurveyInvitationRequest.count(), agentInstance: Agent.findByMlsAgentId(params.id)]
    }


    def brokerReport = {
        if (!params.max) params.max = 10
        [surveyInvitationRequestInstanceList: Broker.get(params.id).surveyInvitationRequests, surveyInvitationRequestInstanceTotal: SurveyInvitationRequest.count(), brokerInstance: Broker.get(params.id)]

    }

    def create = {
        /* if (!authenticateService.ifAnyGranted("ROLE_ADMIN") && !authenticateService.ifAnyGranted("ROLE_BROKER")) {
                    flash.message = "You are not authorized to create notifications"
                    redirect(action: "list")
                }
        */
        def notificationInstance = Notification.get(params.notificationId)
        if (notificationInstance.surveyInvitationRequest != null) {
            redirect(action: "edit", params: params, id: notificationInstance.surveyInvitationRequest.id)
        }
        Person user = authenticateService.userDomain()
        if (!dataAccessService.isMyNotification(notificationInstance, user)) {
            flash.message = "You are not authorized to save this survey invitation request"
            redirect(action: "list")
        }


        def surveyInvitationRequestInstance = new SurveyInvitationRequest()
        surveyInvitationRequestInstance.properties = params

        surveyInvitationRequestInstance.notification = notificationInstance
        return [surveyInvitationRequestInstance: surveyInvitationRequestInstance]
    }

    def save = {
        println "params=$params"
        def surveyInvitationRequestInstance = new SurveyInvitationRequest(params)
        def notificationInstance = Notification.get(params."notification.id")
        Person user = authenticateService.userDomain()
        if (!dataAccessService.isMyNotification(notificationInstance, user)) {
            flash.message = "You are not authorized to save this survey invitation request"
            redirect(action: "list")
        }
        notificationInstance.surveyInvitationRequest = surveyInvitationRequestInstance
        serviceProviderService.correctServiceProviderTypes(surveyInvitationRequestInstance)
        if (notificationInstance.save(flush: true)) {
            //if (surveyInvitationRequestInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'surveyInvitationRequest.label', default: 'SurveyInvitationRequest'), surveyInvitationRequestInstance.id])}"
            redirect(action: "show", id: surveyInvitationRequestInstance.id)
        }
        else {
            println notificationInstance.errors
            render(view: "create", model: [surveyInvitationRequestInstance: surveyInvitationRequestInstance])
        }
    }

    def show = {
        def surveyInvitationRequestInstance = SurveyInvitationRequest.get(params.id)
        if (!surveyInvitationRequestInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'surveyInvitationRequest.label', default: 'SurveyInvitationRequest'), params.id])}"
            redirect(action: "list")
        }
        else {

            Person user = authenticateService.userDomain()
            if (!dataAccessService.isMyInvitation(surveyInvitationRequestInstance, user)) {
                flash.message = "You are not authorized to view this survey invitation request"
                redirect(action: "list")
            }
            [surveyInvitationRequestInstance: surveyInvitationRequestInstance]
        }
    }

    def edit = {
        def surveyInvitationRequestInstance = SurveyInvitationRequest.get(params.id)
        if (!surveyInvitationRequestInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'surveyInvitationRequest.label', default: 'SurveyInvitationRequest'), params.id])}"
            redirect(action: "list")
        }
        else {
            Person user = authenticateService.userDomain()
            if (!dataAccessService.isMyInvitation(surveyInvitationRequestInstance, user)) {
                flash.message = "You are not authorized to view this survey invitation request"
                redirect(action: "list")
            }
            return [surveyInvitationRequestInstance: surveyInvitationRequestInstance]
        }
    }

    def update = {
        def surveyInvitationRequestInstance = SurveyInvitationRequest.get(params.id)
        if (surveyInvitationRequestInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (surveyInvitationRequestInstance.version > version) {

                    surveyInvitationRequestInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'surveyInvitationRequest.label', default: 'SurveyInvitationRequest')] as Object[], "Another user has updated this SurveyInvitationRequest while you were editing")
                    render(view: "edit", model: [surveyInvitationRequestInstance: surveyInvitationRequestInstance])
                    return
                }
            }
            surveyInvitationRequestInstance.properties = params
            serviceProviderService.correctServiceProviderTypes(surveyInvitationRequestInstance)
            if (!surveyInvitationRequestInstance.hasErrors() && surveyInvitationRequestInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'surveyInvitationRequest.label', default: 'SurveyInvitationRequest'), surveyInvitationRequestInstance.id])}"
                redirect(action: "show", id: surveyInvitationRequestInstance.id)
            }
            else {
                Person user = authenticateService.userDomain()
                if (!dataAccessService.isMyInvitation(surveyInvitationRequestInstance, user)) {
                    flash.message = "You are not authorized to edit this survey invitation request"
                    redirect(action: "list")
                }
                render(view: "edit", model: [surveyInvitationRequestInstance: surveyInvitationRequestInstance])
            }
        }
    }
/*
    def delete = {
        if (!authenticateService.ifAnyGranted("ROLE_ADMIN")) {
            flash.message = "You are not authorized to delete survey invitation requests"
            redirect(action: "list")
        }
        def surveyInvitationRequestInstance = SurveyInvitationRequest.get(params.id)
        if (surveyInvitationRequestInstance) {
            try {
                surveyInvitationRequestInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'surveyInvitationRequest.label', default: 'SurveyInvitationRequest'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'surveyInvitationRequest.label', default: 'SurveyInvitationRequest'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'surveyInvitationRequest.label', default: 'SurveyInvitationRequest'), params.id])}"
            redirect(action: "list")
        }
    }
*/
    def agentCompletesResponseEvent = {
        def notification = Notification.get(params.notificationId)
        notificationFlowService.agentCompletesResponseEvent(notification)
        flash.message = "Survey Request Sent to Client"
        redirect(action: "show", id: params.id)
    }


    def updateAndSend = {
        def surveyInvitationRequestInstance = SurveyInvitationRequest.get(params.id)
        if (surveyInvitationRequestInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (surveyInvitationRequestInstance.version > version) {

                    surveyInvitationRequestInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'surveyInvitationRequest.label', default: 'SurveyInvitationRequest')] as Object[], "Another user has updated this SurveyInvitationRequest while you were editing")
                    render(view: "edit", model: [surveyInvitationRequestInstance: surveyInvitationRequestInstance])
                    return
                }
            }
            surveyInvitationRequestInstance.properties = params
            Person user = authenticateService.userDomain()
            if (!dataAccessService.isMyInvitation(surveyInvitationRequestInstance, user)) {
                flash.message = "You are not authorized to edit this survey invitation request"
                redirect(action: "list")
            }

            correctServiceProviderTypes(surveyInvitationRequestInstance)

            if (!surveyInvitationRequestInstance.hasErrors() && surveyInvitationRequestInstance.save(flush: true)) {
                def notification = Notification.get(params.notificationId)
                notificationFlowService.agentCompletesResponseEvent(notification)
                notificationFlowService.sendSurveyInvitationAction(notification)
                flash.message = "Changes Saved and Survey Request Sent to Client"
                redirect(action: "show", id: params.id)
            }
            else {
                render(view: "edit", model: [surveyInvitationRequestInstance: surveyInvitationRequestInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'surveyInvitationRequest.label', default: 'SurveyInvitationRequest'), params.id])}"
            redirect(action: "list")
        }
    }

    def searchAJAXLenderProviders = {
        searchAJAXProviders("lender")
    }

    def searchAJAXHouseInspectorProviders = {
        searchAJAXProviders("house inspector")
    }

    def searchAJAXMoldInspectorProviders = {
        searchAJAXProviders("mold inspector")
    }

    def searchAJAXRadonInspectorProviders = {
        searchAJAXProviders("radon inspector")
    }

    def searchAJAXTermiteInspectorProviders = {
        searchAJAXProviders("termite inspector")
    }




    def searchAJAXProviders(String type) {
        println params
        def field = "lookupName"



        def ajaxResults = ServiceProvider.createCriteria().list(max: 10, sort: field, order: "asc") {

            and {
                ilike(field, "${params.query}%")

                'in'("type", [type, "not defined"])

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

    def correctServiceProviderTypes(SurveyInvitationRequest sir) {
        if (sir?.lender?.type == "not defined") {
            sir.lender.type = "lender"
        }
        if (sir?.houseInspector?.type == "not defined") {
            sir.houseInspector.type = "house inspector"
        }
        if (sir?.moldInspector?.type == "not defined") {
            sir.moldInspector.type = "mold inspector"
        }
        if (sir?.radonInspector?.type == "not defined") {
            sir.radonInspector.type = "radon inspector"
        }
        if (sir?.termiteInspector?.type == "not defined") {
            sir.termiteInspector.type = "termite inspector"
        }
        if (sir?.attorney?.type == "not defined") {
            sir.attorney.type = "attorney"
        }
    }


}
