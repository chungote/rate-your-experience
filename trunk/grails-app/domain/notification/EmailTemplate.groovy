package notification

class EmailTemplate {

  String name
  String requestForInformationSubject="Rate Your Experience- Request for Information"
  String requestForInformationBody
  String secondRequestForInformationSubject="Rate Your Experience - Request For Information - Second Notice"
  String secondRequestForInformationBody
  String surveyInvitationRequestSubject="You are Invited to Rate Your Experience"
  String surveyInvitationRequestBody
  String surveyCompletionNotificationSubject="Rate Your Experience - Survey Completed"
  String surveyCompletionNotificationBody
  String surveyApprovalRequestSubject="Rate Your Experience - Survey Response Pending Approval"
  String surveyApprovalRequestBody

	
    static constraints = {
      name(maxSize:250)
       requestForInformationSubject(maxSize:250,nullable:true)
       requestForInformationBody(maxSize:2000,nullable:true)
       secondRequestForInformationSubject(maxSize:250,nullable:true)
       secondRequestForInformationBody(maxSize:2000,nullable:true)
       surveyInvitationRequestSubject(maxSize:250,nullable:true)
       surveyInvitationRequestBody(maxSize:2000,nullable:true)
       surveyCompletionNotificationSubject(maxSize:250,nullable:true)
       surveyCompletionNotificationBody(maxSize:2000,nullable:true)
       surveyApprovalRequestSubject(maxSize:250,nullable:true)
       surveyApprovalRequestBody(maxSize:2000,nullable:true)

    }
	
	Date dateCreated
	Date lastUpdated
	
	String toString() {
		"${name} [$id]"
	}
	
}
