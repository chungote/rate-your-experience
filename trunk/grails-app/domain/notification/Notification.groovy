package notification

import survey.SurveyResponse
import transaction.Listing
import transaction.RETransaction
import security.Person
import participant.Agent
import participant.Broker

class Notification {

	static mapping= {
		flowState index:'flow_state_idx'
		surveyReleased index:'survey_released_idx'
		informationFirstDueDateFlag index:'information_first_due_idx'
		informationSecondDueDateFlag index:'information_second_due_idx'
	}

  static constraints = {
    flowState(maxSize: 255)
    transaction(nullable: true)
    template(nullable: true)

    informationRequestedDate(nullable: true)
    informationFirstDueDateFlag()
    informationSecondDueDateFlag()
    surveyInvitationRequest(nullable: true)
    informationRequestCompletedDate(nullable: true)

    surveyRequestedDate(nullable: true)
    surveyFirstDueDateFlag()
    surveyResponse(nullable: true)
    surveyCompletedDate(nullable: true)

    agentNotifiedOfSurveyDate(nullable: true)
    adminNotifiedOfSurveyDate(nullable: true)
    adminReviewedSurveyDate(nullable: true)
    surveyReleased()

    onHold()
    dateCreated()
    lastUpdated()
  }

  NotificationFlowState flowState = NotificationFlowState.START
  RETransaction transaction
  EmailTemplate template
  SurveyInvitationRequest surveyInvitationRequest
  SurveyResponse surveyResponse

  Date informationRequestedDate
  Date informationRequestCompletedDate
  boolean informationFirstDueDateFlag = false
  boolean informationSecondDueDateFlag = false

  Date surveyRequestedDate
  Date surveyCompletedDate
  boolean surveyFirstDueDateFlag = false

  Date agentNotifiedOfSurveyDate
  Date adminNotifiedOfSurveyDate
  Date adminReviewedSurveyDate
  boolean surveyReleased = false

  boolean onHold


  Date dateCreated
  Date lastUpdated

  String toString() {
    "notification:${listing?.mlsNumber}"
  }

  static transients = [
          "listing",
          "sellingAgent",
          "sellingOffice",
          "sellingBroker",
          "agentEmail",
          "adminEmail",
          "ryeEmail",
          "clientEmail",
          "clientName",
          "configuration",
  ]

  def configuration = [ryeEmail: "ryeTest@roninTech.org", adminEmail: "ryeTest@roninTech.org"]

  String getAgentEmail() {
	  def agent = transaction?.listing?.sellingAgent
	  if (agent?.broker?.centralizedResponder) {
	    return agent?.broker?.centralizedResponder.email

	  }
	  if (agent?.alternateContact) {
		return agent?.alternateContact?.email
	  }
     Person user = Person.findByParticipantId(agent?.id)
     return user.email
  }

  String getClientName() {
    surveyInvitationRequest?.clientName
  }

  String getClientEmail() {
    surveyInvitationRequest?.clientEmail
  }

  String getAdminEmail() {
    configuration?.adminEmail
  }

  String getRyeEmail() {
    configuration?.ryeEmail
  }

  Listing getListing() {
    transaction?.listing
  }

  def setListing(Listing _listing) {
    if (transaction == null) {
      transaction = new RETransaction()
    }
    transaction.listing = _listing
    transaction.save()
  }

  def getSellingAgent() {
    listing?.sellingAgent
  }

  def getSellingOffice() {
    listing?.sellingOffice
  }

  def getSellingBroker() {
    listing?.sellingBroker
  }

}
