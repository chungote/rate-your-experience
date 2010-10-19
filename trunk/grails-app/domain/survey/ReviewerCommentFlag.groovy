
package survey
import security.*

class ReviewerCommentFlag {

   static constraints = {
      flag()
      comments(maxSize: 140, nullable:true)
      commentsResponse(maxSize:140,nullable:true)
      reviewedBy(nullable:true)
      dateReviewed(nullable:true)
  }

  static transients = ["type"]

	String comments
	String commentsResponse
	Boolean flag=false
	Person createdBy
	Person reviewedBy
	Date dateCreated
	Date dateReviewed
	Date lastUpdated

	static belongsTo=[questionResponse:QuestionResponse]

	String toString() {
		"$createdBy.username:$comments"
	}

	String getType() {
		if (this.createdBy.authorities.any{it.authority.equals("ROLE_ADMIN")}) {
			return "admin"
		}
		if (this.createdBy.authorities.any{it.authority.equals("ROLE_BROKER")}){
			return "broker"
		}
		if (this.createdBy.authorities.any{it.authority.equals("ROLE_AGENT")}) {
					return "agent"
		}
		if (this.createdBy.authorities.any{it.authority.equals("ROLE_PROVIDER")}) {
					return "provider"
		}
	}

}
