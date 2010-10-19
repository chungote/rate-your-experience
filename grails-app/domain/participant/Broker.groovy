package participant

import notification.Notification
import notification.SurveyInvitationRequest
import security.Person
import survey.SurveyResponse
import transaction.Listing

class Broker {

  String mlsOfficeId
  String mlsMainOfficeId
  String mlsBrokerId
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
  Person centralizedResponder
  Integer termsOfServiceId

  def sessionFactory

  static mapping = {
	   mlsMainOfficeId index:'mls_main_office_idx'
	   mlsOfficeId index:'mls_office_idx'
	   companyName index:'company_name_idx'
	   optInRatings index:'opt_in_rating_idx'
	   optInPublicDisplay index:'opt_in_display_idx'

  }


  static constraints = {
    mlsOfficeId(maxSize: 25, nullable: true)
    mlsMainOfficeId(maxSize: 25, nullable: true)
    mlsBrokerId(maxSize: 25, nullable: true)
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
    termsOfServiceId(nullable: true)
    centralizedResponder(nullable:true)
  }



  static transients = [
          "agents",
          "offices",
          "sellerListings",
          "buyerListings",
          "responses",
          "notifications",
          "surveyInvitationRequests",
          "agentRatingAverage",
          "experienceRatingAverage",
          "notificationsTotal",
          "surveyRequestTotal",
          "surveyResponseTotal",
          "agentsTotal",
          "listingsTotal"
  ]

  Date dateCreated
  Date lastUpdated

  String toString() {
    "${firstName} ${lastName}"
  }

  def getAgents() {
    Agent.findAllByMlsMainOfficeId(mlsMainOfficeId).sort {it.lastName}
  }

  def getOffices() {
    Office.findAllByMlsMainOfficeId(mlsMainOfficeId).sort {it.officeName}
  }

  def getSellerListings() {
    agents.sellerListings.flatten()
  }


  def getBuyerListings() {
    agents.buyerListings.flatten()
  }

  def getResponses() {
    agents.responses.flatten()
  }

  def getNotifications() {
    agents.notifications.flatten()
  }

  def getSurveyInvitationRequests() {
    agents.surveyInvitationRequests.flatten()
  }

    def getNotificationCount() {
    def ret = notifications.size()
    return ret
  }

    def getSurveyRequestCount() {
    def ret = surveyInvitationRequests.size()
    return ret
  }

    def getSurveyResponseCount() {
    def ret = responses.size()
    return ret
  }

    def getAgentCount() {
    def ret = agents.size()
    return ret
  }

    def getListingCount() {
    def ret = sellerListings.size() + buyerListings.size()
    return ret
  }

  Float getAgentRatingAverage(){
      def ret = 0.0f
  	def hSession = sessionFactory.getCurrentSession()
  	def queryString="""
	select avg(question_response.rating) from question_response,question_group,question,survey_response_question_response,
	notification,agent,listing,retransaction,broker
	where question_response.question_id=question.id
	and question_group.id=question.group_id
	and notification.survey_response_id=survey_response_question_response.survey_response_responses_id
	and question_response.id=survey_response_question_response.question_response_id
	and question_group.type='agent'
	and question_response.rating is not null
	and question_response.rating >0
	and agent.mls_agent_id=listing.selling_agent_mls_id
	and listing.id=retransaction.listing_id
	and retransaction.id=notification.transaction_id
	and agent.mls_main_office_id=broker.mls_main_office_id
	and broker.id=${this.id}
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

Float getExperienceRatingAverage(){
      def ret = 0.0f
  	def hSession = sessionFactory.getCurrentSession()
  	def queryString="""
	select avg(question_response.rating) from question_response,question,survey_response_question_response,
	notification,agent,listing,retransaction,broker
	where question_response.question_id=question.id
	and notification.survey_response_id=survey_response_question_response.survey_response_responses_id
	and question_response.id=survey_response_question_response.question_response_id
	and question_response.rating is not null
	and question_response.rating >0
	and agent.mls_agent_id=listing.selling_agent_mls_id
	and listing.id=retransaction.listing_id
	and retransaction.id=notification.transaction_id
	and agent.mls_main_office_id=broker.mls_main_office_id
	and broker.id=${this.id}
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




  Boolean isMyAgent(Agent agent){

	if(agent!=null && agent.mlsMainOfficeId==this.mlsMainOfficeId) {
		return true
	} else{
		return false
	}

  }

   Boolean isMyResponse(SurveyResponse response){

	def agent=response?.notification?.sellingAgent
	if(agent && isMyAgent(agent)){
  		return true
  	} else{
  		return false
  	}

  }

   Boolean isMyInvitation(SurveyInvitationRequest request){

	   def agent=request?.notification?.sellingAgent

  	if(agent && isMyAgent(agent)) {
  		return true
  	} else{
  		return false
  	}

  }

   Boolean isMyNotification(Notification notification){

	  def agent=notification?.sellingAgent
		if( agent && isMyAgent(agent)) {
    		return true
    	} else{
    		return false
    	}

  }

 Boolean isMyListing(Listing listing){
	    def agent=listing?.sellingAgent

    	if(agent && isMyAgent(agent)) {
    		return true
    	} else{
    		return false
    	}

  }

  def getAgentUsers() {

	  	  def agents = Person.createCriteria().list(sort: "userRealName", order: "asc") {
  	  			and {

  	  	  			'in'('participantId',agents.id.collect{it.toInteger()})
  	  	  			}

		}
		return agents
 }


}
