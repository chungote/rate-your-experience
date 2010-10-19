package notification

import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH

import system.Hash

class NotificationMailerService {

    boolean transactional = false
    def engine = new groovy.text.SimpleTemplateEngine()
    def serverUrl = CH.config.grails.serverURL //"http://173.203.99.100/RateYourExperience"

    def genTemplate(def notification, String templateString, def url) {

        if (templateString == null) {
            return ""
        }

        def template = engine.createTemplate(templateString)
        def binding = [
                notification: notification,
                agent: notification.sellingAgent,
                listing: notification.listing,
                office: notification.sellingOffice,
                broker: notification.sellingBroker,
                url: url,
                clientName: notification.clientName,
                clientEmail: notification.clientEmail,
                //ryeMail: notification.ryeEmail,
        ]

        return template.make(binding).toString()
    }

    //	Send Email ‘Request for Information’ to Listing and Selling Agents

    def sendRequestForInformation(Notification notification) {
        def url = "${serverUrl}/surveyInvitationRequest/create?notificationId=${notification.id}"

        sendMail {
            to "${notification.agentEmail}"
            from "${notification.ryeEmail}"
            //cc "marge@g2one.com", "ed@g2one.com"
            //bcc "joe@g2one.com"
            subject genTemplate(notification, notification?.template?.requestForInformationSubject, url)
            body genTemplate(notification, notification?.template?.requestForInformationBody, url)
        }
    }

    //	Send Email Survey Invitation to Client

    def sendSurveyInvitationRequest(Notification notification) {
        //def url = "${serverUrl}/surveyResponse/create?notificationId=${notification.id}"
        final def hash = new Hash(notification.id.toString(), Hash.MD5_SALT)
        hash.save()
        def id = hash.code
        def url = "${serverUrl}/surveyResponse/create/${id}"

        sendMail {
            to "${notification.clientEmail}"
            from "${notification.agentEmail}"
            //cc "marge@g2one.com", "ed@g2one.com"
            //bcc "joe@g2one.com"
            subject genTemplate(notification, notification?.template?.surveyInvitationRequestSubject, url)
            body genTemplate(notification, notification?.template?.surveyInvitationRequestBody, url)
        }
    }

    //	Send Email Notification sent to Agent verifying completion of survey

    def sendSurveyCompletionNotification(Notification notification) {
        def url = "${serverUrl}/surveyResponse/show/${notification.surveyResponse.id}"

        sendMail {
            to "${notification.agentEmail}"
            from "${notification.ryeEmail}"
            //cc "marge@g2one.com", "ed@g2one.com"
            //bcc "joe@g2one.com"
            subject genTemplate(notification, notification?.template?.surveyCompletionNotificationSubject, url)
            body genTemplate(notification, notification?.template?.surveyCompletionNotificationBody, url)
        }
    }
    //	Send Email Notification sent to Admin requesting approval

    def sendAdminSurveyApprovalRequest(Notification notification) {
        def url = "${serverUrl}/surveyResponse/show/${notification.surveyResponse.id}"

        sendMail {
            to "${notification.adminEmail}"
            from "${notification.ryeEmail}"
            //cc "marge@g2one.com", "ed@g2one.com"
            //bcc "joe@g2one.com"
            subject genTemplate(notification, notification?.template?.surveyApprovalRequestSubject, url)
            body genTemplate(notification, notification?.template?.surveyApprovalRequestBody, url)
        }
    }

}
