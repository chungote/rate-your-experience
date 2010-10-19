package survey

/**
 * code: Unique code that will identify the question, the code must be unique within a survey (mandatory)
 * type: Specifies the type of field that should be constructed on the form for this question, see above list for current types (mandatory)
 * 		multiplechoice: Allows the user to select all of the answers that apply from a list of possible choices, check boxes are used for this question type as multiple selections can be made
 * 		singlechoice: Allows the user to select one answer from a list of possible choices, radio buttons are used for the question type as only a single answer can be selected
 * 		textbox: Allows the user to enter a large amount of free text, the size of the text box can be specified
 * 		textfield: Allows the user to enter a small amount of free form text, the size of the text field can be specified
 *
 * question: The text of the question, this field is optional as subquestions do not have to have question text
 * textbox_size: Specifies the size of the text box to construct, rows x cols, defaults to 30×5 (optional)
 * textfield_size: Specified the size of the text field that should be constructed, specified in the number of visible characters, default to 30 (optional)
 * header: Specifies a separate heading for the question. The text will be displayed above the question allowing questions to be broken up into subsections (optional)
 * required: Specifies that an answer is required for this question
 * sort_order: Specifies the sort order for the question
 * help: Help text that will be displayed below the question
 * answers: Defines the answers to the question if the question type displays a list of possibilities to the user
 *

 *
 * @author jbrush
 *
 */

//enum QuestionType { SINGLE_CHOICE, MULTIPLE_CHOICE, TEXTBOX, TEXTFIELD }


class Question {

  static mapping = {
    sort "sortOrder"
    answers fetch: 'join'
  }
  static constraints = {
    group()
    sortOrder(max: 999)
    text(maxSize: 255)
    header(maxSize: 255, nullable: true)
    help(maxSize: 255, nullable: true)
    questionType(maxSize: 15, inList: ['SINGLE_CHOICE', 'MULTIPLE_CHOICE', 'TEXTBOX', 'TEXTFIELD'])
    textBoxSize(max: 9999, nullable: true)
    textFieldSize(max: 9999, nullable: true)
    answers()
    rateable()
    required()
    dateCreated()
    lastUpdated()
  }



  Date dateCreated
  Date lastUpdated


  Integer sortOrder
  String text
  //QuestionType
  String questionType = "TEXTFIELD"
  Integer textBoxSize = 75
  Integer textFieldSize = 50
  String header
  Boolean required = true
  Boolean rateable = true
  String help

  List answers
  static hasMany = [answers: Answer]
  static belongsTo = [group: QuestionGroup]

  String toString() {
    "$sortOrder. $text"
  }

}
