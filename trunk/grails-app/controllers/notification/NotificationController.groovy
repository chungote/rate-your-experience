package notification

import participant.Agent
import participant.Broker
import security.Person

class NotificationController {

    static scaffold = true
    def notificationFlowService
    def authenticateService
    def dataAccessService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        if (!params.sort) {
            params.sort = "lastUpdated"
            params.order = "desc"
        }
        [notificationInstanceList: Notification.list(params), notificationInstanceTotal: Notification.count()]
    }
    def report = {
        if (!params.max) params.max = 10
        if (!params.sort) {
            params.sort = "lastUpdated"
            params.order = "desc"
        }
        Agent agentInstance = Agent.findByMlsAgentId(params.id)
        if (authenticateService.ifAnyGranted("ROLE_AGENT")) {
            Person user = authenticateService.userDomain()
            agentInstance = user.getParticipant()
        }

        [notificationInstanceList: agentInstance.notifications, notificationInstanceTotal: Notification.count(), agentInstance: Agent.findByMlsAgentId(params.id)]
    }

    def brokerReport = {
        if (!params.max) params.max = 10
        if (!params.sort) {
            params.sort = "lastUpdated"
            params.order = "desc"
        }
        if (authenticateService.ifAnyGranted("ROLE_AGENT")) {
            flash.message = "You are not authorized to view notifications at the broker level"
            redirect(action: "list")
        }
        Broker brokerInstance = Broker.get(params.id)
        if (authenticateService.ifAnyGranted("ROLE_BROKER")) {
            Person user = authenticateService.userDomain()
            brokerInstance = user.getParticipant()
        }

        [notificationInstanceList: brokerInstance.notifications, notificationInstanceTotal: Notification.count(), brokerInstance: Broker.get(params.id)]

    }

    def pendingInformation = {
        if (!params.max) params.max = 10
        if (!params.sort) {
            params.sort = "lastUpdated"
            params.order = "desc"
        }
        [
                notificationInstanceList: Agent.get(params.id).notifications,
                notificationInstanceTotal: Notification.count(),
                agentInstance: Agent.findByMlsAgentId(params.id)
        ]
    }

    def pendingAdmin = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        if (!params.sort) {
            params.sort = "lastUpdated"
            params.order = "desc"
        }
        [notificationInstanceList: Notification.list(params), notificationInstanceTotal: Notification.count()]
    }

    def create = {
        def notificationInstance = new Notification()
        notificationInstance.properties = params
        return [notificationInstance: notificationInstance]
    }

    def save = {
        def notificationInstance = new Notification(params)
        if (notificationInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'notification.label', default: 'Notification'), notificationInstance.id])}"
            redirect(action: "show", id: notificationInstance.id)
        }
        else {
            render(view: "create", model: [notificationInstance: notificationInstance])
        }
    }

    def show = {
        def notificationInstance = Notification.get(params.id)
        if (!notificationInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'notification.label', default: 'Notification'), params.id])}"
            redirect(action: "list")
        }
        else {
            Person user = authenticateService.userDomain()
            if (!dataAccessService.isMyNotification(notificationInstance, user)) {
                flash.message = "You are not authorized to view this notification"
                redirect(action: "list")
            }

            [notificationInstance: notificationInstance]
        }
    }

    def edit = {
        def notificationInstance = Notification.get(params.id)
        if (!notificationInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'notification.label', default: 'Notification'), params.id])}"
            redirect(action: "list")
        }
        else {

            Person user = authenticateService.userDomain()
            if (!dataAccessService.isMyNotification(notificationInstance, user)) {
                flash.message = "You are not authorized to view this notification request"
                redirect(action: "list")
            }

            return [notificationInstance: notificationInstance]
        }
    }

    def update = {
        def notificationInstance = Notification.get(params.id)
        if (notificationInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (notificationInstance.version > version) {

                    notificationInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'notification.label', default: 'Notification')] as Object[], "Another user has updated this Notification while you were editing")
                    render(view: "edit", model: [notificationInstance: notificationInstance])
                    return
                }
            }
            notificationInstance.properties = params
            Person user = authenticateService.userDomain()
            if (!dataAccessService.isMyNotification(notificationInstance, user)) {
                flash.message = "You are not authorized to update this notification"
                redirect(action: "list")
            }

            if (!notificationInstance.hasErrors() && notificationInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'notification.label', default: 'Notification'), notificationInstance.id])}"
                redirect(action: "show", id: notificationInstance.id)
            }
            else {

                render(view: "edit", model: [notificationInstance: notificationInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'notification.label', default: 'Notification'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        if (!authenticateService.ifAnyGranted("ROLE_ADMIN")) {
            flash.message = "You are not authorized to delete notifications"
            redirect(action: "list")
        }
        def notificationInstance = Notification.get(params.id)
        if (notificationInstance) {
            try {
                notificationInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'notification.label', default: 'Notification'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'notification.label', default: 'Notification'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'notification.label', default: 'Notification'), params.id])}"
            redirect(action: "list")
        }
    }

    def newSoldListingEvent = {
        def notification = Notification.get(params.id)
        notificationFlowService.newSoldListingEvent(notification.transaction)
    }

    def agentCompletesResponseEvent = {
        def notification = Notification.get(params.id)
        notificationFlowService.sendSurveyInvitationAction(notification)
    }

    def clientCompletesSurveyEvent = {
        def notification = Notification.get(params.id)
        notificationFlowService.sendSurveyCompletionNotificationAction(notification)
        notificationFlowService.sendAdminSurveyApprovalRequestAction(notification)
    }

    def adminApprovesSurveyResponseEvent = {
        def notification = Notification.get(params.id)
        notificationFlowService.flagSurveyResponseForDisplayAction(notification)
    }

}
