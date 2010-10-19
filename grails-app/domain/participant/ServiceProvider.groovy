package participant
import notification.SurveyInvitationRequest
import survey.SurveyResponse

import security.Person

/**
 * Created by IntelliJ IDEA.
 * User: Paula
 * Date: Mar 4, 2010
 * Time: 11:35:24 AM
 * To change this template use File | Settings | File Templates.
 */
class ServiceProvider {
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
    Person modifiedBy
    Boolean optInRatings = true
    Boolean optInPublicDisplay = true
    Boolean enabled = true
    String lookupName
    String userCode

    Date dateCreated
    Date lastUpdated

    def sessionFactory

    final static def TYPES = [
            "not defined",
            "attorney",
            "house inspector",
            "lender",
            "mold inspector",
            "radon inspector",
            "termite inspector"
    ]
    static transients = [TYPES,
    "responses",
    "invitations",
    "ratingAverage"]

    static constraints =
    {
        firstName(maxSize: 50)
        lastName(maxSize: 50)
        middleName(maxSize: 50, nullable: true)
        suffix(maxSize: 20, nullable: true)
        title(maxSize: 50, nullable: true)
        companyName(maxSize: 100, nullable: true)
        type(inList: ServiceProvider.TYPES)
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
        enabled()
        lookupName(maxSize: 255, nullable: true)
        modifiedBy(nullable: true)
        userCode(nullable: true)
        optInRatings()
        optInPublicDisplay()

    }

    String toString() {
        "${lookupName}:${type}"
    }

     Float getRatingAverage(){
		def typeArray=this.type.split()
		def typeColumn=typeArray[0]+"_"+typeArray[1]

	    def ret = 0.0f
		def hSession = sessionFactory.getCurrentSession()
		def queryString="""select avg(question_response.rating) as avg from question_response,question_group,question,survey_response_question_response,
		notification,survey_invitation_request,service_provider
		where question_response.question_id=question.id
		and question_group.id=question.group_id
		and notification.survey_response_id=survey_response_question_response.survey_response_responses_id
		and question_response.id=survey_response_question_response.question_response_id
		and question_group.type='${type}'
		and question_response.rating is not null
		and question_response.rating>0
		and survey_invitation_request.${typeColumn}_id=service_provider.id
		and survey_invitation_request.id=notification.survey_invitation_request_id
		and service_provider.id=${this.id}
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


  List getResponses() {
    invitations?.notification?.surveyResponse?.flatten().findAll {it}
  }

  List getInvitations() {
	  def invitations
	      switch (type) {
	              case "lender":
	                  return    invitations= SurveyInvitationRequest.findAllByLender(this)
	                  break
				 case "attorney":
	                  return    invitations= SurveyInvitationRequest.findAllByAttorney(this)
	                  break
				 case "house inspector":
	                  return    invitations= SurveyInvitationRequest.findAllByHouseInspector(this)
	                  break
				 case "radon inspector":
	                  return    invitations= SurveyInvitationRequest.findAllByRadonInspector(this)
	                  break

				 case "mold inspector":
	                  return    invitations= SurveyInvitationRequest.findAllByMoldInspector(this)
	                  break
				 case "termite inspector":
						  return invitations= SurveyInvitationRequest.findAllByTermiteInspector(this)
						  break
		}

  }

Boolean isMyResponse(SurveyResponse response) {

	      switch (type) {
	              case "lender":
	       			if(response?.notification?.surveyInvitationRequest?.lender!=null && response?.notification?.lender==this) {
		   	    		return true
		   	    	} else{
		   	    		return false
    				}
	                  break
				 case "attorney":
	       			if(response?.notification?.attorney!=null && response?.notification?.attorney==this) {
				   	    		return true
				   	    	} else{
				   	    		return false
		    				}

	                  break
				 case "house inspector":
	       			if(response?.notification?.houseInspector!=null && response?.notification?.houseInspector==this) {
		   	    		return true
		   	    	} else{
		   	    		return false
    				}
	                  break
				 case "radon inspector":
	       			if(response?.notification?.radonInspector!=null && response?.notification?.radonInspector==this) {
				   	    		return true
				   	    	} else{
				   	    		return false
		    				}

	                  break

				 case "mold inspector":
	       			if(response?.notification?.moldInspector!=null && response?.notification?.moldInspector==this) {
				   	    		return true
				   	    	} else{
				   	    		return false
		    				}

	                  break
				 case "termite inspector":
		   			if(response?.notification?.termiteInspector!=null && response?.notification?.termiteInspector==this) {
				   	    		return true
				   	    	} else{
				   	    		return false
		    				}

						  break
		}

  }




}
