package survey

class QuestionResponse {

  static constraints = {
    question()
    rating(max: 10, nullable: true)
    text(maxSize: 255, nullable: true)
    profaneText(maxSize: 255, nullable: true)
    textFiltered()
   // rebuttal(maxSize: 255, nullable: true)
   // profaneRebuttal(nullable: true)
   // rebuttalFiltered()
   // rebuttalHidden()
    commentFlags(nullable:true)
  }

	static transients=["isHidden","hasReviewRequest"]

  Question question
  String text
  String profaneText
  boolean textFiltered = false
  Integer rating
  //String rebuttal
  //String profaneRebuttal
  //boolean rebuttalFiltered = false
  //boolean rebuttalHidden = false

  Date dateCreated
  Date lastUpdated

  List commentFlags
  static hasMany = [commentFlags: ReviewerCommentFlag]

  String toString() {
    "${this.class.name} $id"
  }

 Boolean hasReviewRequest() {
	 if (commentFlags?.any{ it.reviewedBy==null && it.flag==true}) {
		 return true
	 }else {
		 return false
	 }

 }



 Boolean isHidden() {
 	 if (commentFlags?.any{it.flag==true}) {
 		 return true
 	 }else {
 		 return false
 	 }

 }

}
