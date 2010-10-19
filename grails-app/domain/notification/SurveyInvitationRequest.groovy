package notification

import participant.ServiceProvider
import transaction.RETransaction
import survey.Survey
/**
 * Created by IntelliJ IDEA.
 * User: Paula
 * Date: Mar 4, 2010
 * Time: 11:09:06 AM
 * To change this template use File | Settings | File Templates.
 */
class SurveyInvitationRequest {

  //Notification notification
  Survey survey
  ServiceProvider lender
  ServiceProvider houseInspector
  ServiceProvider radonInspector
  ServiceProvider termiteInspector
  ServiceProvider moldInspector
  ServiceProvider attorney
  String clientName=""
  String clientEmail=""
  Date dateCreated
  Date lastUpdated

  static belongsTo = [notification:Notification]
  static constraints =
  {
    notification()
    survey()
    clientName(maxSize: 120)
    clientEmail(maxSize: 200)
    lender(nullable: true)
    houseInspector(nullable: true)
    radonInspector(nullable: true)
    termiteInspector(nullable: true)
    moldInspector(nullable: true)
    attorney(nullable: true)
  }

  String toString() {
      "invitation:${notification?.listing}"
  }

}
