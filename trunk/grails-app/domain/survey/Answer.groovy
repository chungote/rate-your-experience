package survey

/**
 *
 * code: Code to uniquely identify the answer, code needs to be unique for each question (mandatory)
 * answer: The text that will be displayed to the user (mandatory)
 * default: If set to Y then this answer will be selected by default (optional)
 * sort_order: The sort order for this answer (mandatory)
 * subquestions: Some answers may need additional information, another question can be defined to obtain
 * 		this information. To define a subquestions the same fields that define a normal question is used (optional)
 *
 * @author jbrush
 *
 */
class Answer {
  static mapping = {
    sort "sortOrder"
  }
  static constraints = {
    question()
    sortOrder(max: 999)
    text(maxSize: 255)
    defaultAnswer()
    dateCreated()
    lastUpdated()

  }

  Date dateCreated
  Date lastUpdated

  int sortOrder
  String text
  boolean defaultAnswer = false

  //static hasMany = [ subquestions:Question ]
  static belongsTo = [question: Question]

  String toString() {
    "$sortOrder. $text"
  }

}
