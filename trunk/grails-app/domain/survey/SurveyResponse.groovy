package survey

import notification.Notification

class SurveyResponse {
def sessionFactory

    static constraints = {
        notification()
        survey()
        ratingAverage(nullable: true)
        rebuttal(maxSize: 255, nullable: true)
        profaneRebuttal(maxSize: 255, nullable: true)
        rebuttalHidden(nullable: true)
        //rebuttalFiltered(nullable:true)
    }
  static transients = [
 	"experienceRatingAverage"
 ]
    Survey survey

    String rebuttal
    String profaneRebuttal
    Boolean rebuttalFiltered = false
    Boolean rebuttalHidden = false

    Float ratingAverage = 0.0f

    static hasMany = [responses: QuestionResponse]
    static belongsTo = [notification: Notification]

    Date dateCreated
    Date lastUpdated

    String toString() {
        "${this.class.name} $id"
    }

    Float getExperienceRatingAverage(){
	      def ret = 0.0f
	  	def hSession = sessionFactory.getCurrentSession()
	  	def queryString="""
		select avg(question_response.rating) from question_response,survey_response_question_response
		where question_response.id=survey_response_question_response.question_response_id
		and question_response.rating is not null
		and question_response.rating>0
		and survey_response_question_response.survey_response_responses_id=${this.id}
		group by survey_response_question_response.survey_response_responses_id	  	"""
	  	def query = hSession.createSQLQuery(queryString)
	   ret=query.list()
		return ret[0]
    }

}
