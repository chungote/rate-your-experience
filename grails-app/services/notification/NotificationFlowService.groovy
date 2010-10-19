package notification

import notification.NotificationFlowState as NFState

import transaction.RETransaction

/**
 * NOTIFICATIONFLOW_STATES
 *    START,
 *    INFORMATION_REQUESTED_FROM_AGENT,
 *    SURVEY_REQUESTED_FROM_CONSUMER,
 *    SURVEY_COMPLETED_BY_CONSUMER,
 *    SURVEY_RELEASED_BY_ADMIN
 */


class NotificationFlowService {

    boolean transactional = false //true

    def notificationMailerService
/* NOT USED
  def next(Notification notification) {
    switch(notification.flowState) {
      case NFState.START:
        newSoldListingEvent(notification)
        break;
      case NFState.INFORMATION_REQUESTED_FROM_AGENT:
        (notification)
        break;
      case NFState.SURVEY_REQUESTED_FROM_CONSUMER:
        agentCompletesResponseEvent(notification)
        break;
      case NFState.SURVEY_COMPLETED_BY_CONSUMER:
        clientCompletesSurveyEvent(notification)
        break;
      case NFState.SURVEY_RELEASED_BY_ADMIN:
        adminApprovesSurveyResponseEvent(notification)
        break;
      default:
        log.error('Unknown NotificationFlowState')
    }
  }
*/
    /////////////
    // EVENTS
    /////////////

    public def newSoldListingEvent(RETransaction transaction) {
        def notification = new Notification()
        notification.transaction = transaction
        notification.template = EmailTemplate.get(1)

        notification.save()

        notificationMailerService.sendRequestForInformation(notification)
        notification.informationRequestedDate = new Date()

        notification.flowState = NFState.INFORMATION_REQUESTED_FROM_AGENT

        notification.save(flush: true)
    }

    public def agentCompletesResponseEvent(Notification notification) {
        notificationMailerService.sendSurveyInvitationRequest(notification)

        notification.surveyRequestedDate = new Date()
        notification.surveyCompletedDate = null; // allows resend of invitation
        notification.flowState = NFState.SURVEY_REQUESTED_FROM_CONSUMER

        notification.save(flush: true)
    }

    public def clientCompletesSurveyEvent(Notification notification) {

        notification.surveyCompletedDate = new Date()
        notification.flowState = NFState.SURVEY_COMPLETED_BY_CONSUMER

        notificationMailerService.sendSurveyCompletionNotification(notification)
        notification.agentNotifiedOfSurveyDate = new Date()

        notificationMailerService.sendAdminSurveyApprovalRequest(notification)
        notification.adminNotifiedOfSurveyDate = new Date()

        notification.save(flush: true)
    }

    public def adminReviewedSurveyResponseEvent(Notification notification) {

        boolean approved = true

        notification.adminReviewedSurveyDate = new Date()
        notification.surveyReleased = approved

        if (approved) {
            notification.flowState = NFState.SURVEY_RELEASED_BY_ADMIN
        }

        notification.save(flush: true)

    }

}
