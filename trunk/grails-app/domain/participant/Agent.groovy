package participant

import notification.Notification
import notification.SurveyInvitationRequest
import security.Person
import survey.SurveyResponse
import transaction.Listing

class Agent {
  String mlsAgentId
  String mlsMainOfficeId
  String mlsOfficeId
  String nrdsId
  String mlsStatus
  String firstName
  String lastName
  String middleName
  String suffix
  String title
  String companyName
  String type
  String streetAddress1
  String streetAddress2
  String streetAddress3
  String city
  String stateOrProvince
  String zip
  String officePhone
  String cellPhone
  String preferredPhone
  String fax
  String email
  String webPage
  String lastModifiedBy
  Boolean optInRatings = true
  Boolean optInPublicDisplay = true
  Boolean enabled = true
  String lookupName
  Person alternateContact
  Integer termsOfServiceId
  String userCode


  def sessionFactory
  static hasMany = [representatives: Person]

static mapping= {
 lookupName index:'lookup_idx'
 mlsAgentId index:'mls_agent_idx'
 mlsMainOfficeId index:'mls_main_office_idx'
 mlsOfficeId index:'mls_office_idx'
 companyName index:'company_name_idx'
 optInRatings index:'opt_in_rating_idx'
 optInPublicDisplay index:'opt_in_display_idx'
}
  static constraints = {
    mlsAgentId(maxSize: 25, nullable: true)
    mlsMainOfficeId(maxSize: 25, nullable: true)
    mlsOfficeId(maxSize: 25, nullable: true)
    nrdsId(maxSize: 25, nullable: true)
    mlsStatus(maxSize: 25, nullable: true)
    firstName(maxSize: 50)
    lastName(maxSize: 50)
    middleName(maxSize: 50, nullable: true)
    suffix(maxSize: 20, nullable: true)
    title(maxSize: 50, nullable: true)
    companyName(maxSize: 100, nullable: true)
    type(inList: ["broker", "agent", "attorney", "house inspector", "lender", "mold inspector", "radon inspector", "termite inspector"])
    streetAddress1(maxSize: 150, nullable: true)
    streetAddress2(maxSize: 150, nullable: true)
    streetAddress3(maxSize: 150, nullable: true)
    city(maxSize: 100, nullable: true)
    stateOrProvince(maxSize: 50, nullable: true)
    zip(maxSize: 20, nullable: true)
    officePhone(maxSize: 20, nullable: true)
    cellPhone(maxSize: 20, nullable: true)
    preferredPhone(maxSize: 20, nullable: true)
    fax(maxSize: 20, nullable: true)
    email(maxSize: 200, nullable: true)
    webPage(maxSize: 500, nullable: true)
    optInRatings()
    optInPublicDisplay()
    enabled()
    lookupName(maxSize: 255, nullabe: true)
    termsOfServiceId(nullable:true)
    alternateContact(nullable:true)
    userCode(nullable:true)
  }

  static transients = [
          "office",
          "broker",
          "sellerListings",
          "buyerListings",
          "responses",
          "notifications",
          "surveyInvitationRequests",
          "experienceRatingAverage",
          "ratingAverage",
          "notificationsTotal",
          "surveyRequestTotal",
          "surveyResponseTotal",
          "listingTotal"
  ]

  Date dateCreated
  Date lastUpdated

  String toString() {
    "${firstName} ${lastName}"
  }

  def getOffice() {
    Office.findByMlsOfficeId(mlsOfficeId)
  }

  def getBroker() {
    Broker.findByMlsMainOfficeId(mlsMainOfficeId)
  }

  def getBuyerListings() {
    Listing.findAllByBuyerAgentMlsId(mlsAgentId)
  }

  def getSellerListings() {
    Listing.findAllBySellingAgentMlsId(mlsAgentId)
  }

  def getResponses() {
    sellerListings.transaction.notification.surveyResponse.flatten().findAll {it}
  }

  def getNotifications() {
    sellerListings.transaction.notification.flatten().findAll {it}
  }

  def getSurveyInvitationRequests() {
    sellerListings.transaction.notification.surveyInvitationRequest.flatten().findAll {it}
  }

  Float getExperienceRatingAverage() {

    def ret = 0.0f


    def count = responses?.size()

    def sum = responses?.ratingAverage?.sum()?:0



    if (count) {
      ret = sum / count
    }
    return ret
  }

  Float getRatingAverage(){
    def ret = 0.0f
	def hSession = sessionFactory.getCurrentSession()
	def queryString="""select avg(question_response.rating) as avg from question_response,question_group,question,survey_response_question_response,
	notification,agent,listing,retransaction
	where question_response.question_id=question.id
	and question_group.id=question.group_id
	and notification.survey_response_id=survey_response_question_response.survey_response_responses_id
	and question_response.id=survey_response_question_response.question_response_id
	and question_group.type='agent'
	and question_response.rating is not null
	and question_response.rating>0
	and agent.mls_agent_id=listing.selling_agent_mls_id
	and listing.id=retransaction.listing_id
	and retransaction.id=notification.transaction_id
	and agent.id=${this.id}
	group by survey_response_id
	"""
	def query = hSession.createSQLQuery(queryString)
	def avgList=query.list()
	def count=avgList?.size()

	if (count && count>0){
		def sum=avgList?.sum()?:0
		ret=sum/count
	}
	return ret
  }

  Float getNotificationsTotal() {
    def ret = notifications.size()
    return ret
  }

  Float getSurveyRequestTotal() {
    def ret = surveyInvitationRequests.size()
    return ret
  }

  Float getSurveyResponseTotal() {
    def ret = responses.size()
    return ret
  }


  Float getListingTotal() {
    def ret = sellerListings.size() + buyerListings.size()
    return ret
  }

   Boolean isMyResponse(SurveyResponse response){
	   if (response==null) {
		   return false
	   }
  	if(response?.notification?.sellingAgent!=null && response?.notification?.sellingAgent==this) {
  		return true
  	} else{
  		return false
  	}

  }

 Boolean isMyInvitation(SurveyInvitationRequest request){


  	if(request?.notification?.sellingAgent==this) {
  		return true
  	} else{
  		return false
  	}

  }

 Boolean isMyNotification(Notification notification){

  	if(notification?.sellingAgent==this) {
  		return true
  	} else{
  		return false
  	}

  }

Boolean isMyListing(Listing listing){
  	if(listing?.sellingAgent==this) {
  		return true
  	} else{
  		return false
  	}

  }


}
