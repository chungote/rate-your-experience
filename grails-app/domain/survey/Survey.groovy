package survey

/**
 * name: Name of the survey (mandatory)
 * welcome: Message displayed at the start of the survey (optional)
 * thank_you: Message displayed at the end of the survey (optional)
 * groups: Defines the question groups within the survey (mandatory)
 *
 * @author jbrush
 *
 */
class Survey {

  static constraints = {
    name(maxSize: 255)
    welcome(maxSize: 255)
    thankYou(maxSize: 255)
    groups()
    dateCreated()
    lastUpdated()
  }
  static mapping = {
    groups fetch: 'join'
  }

  Date dateCreated
  Date lastUpdated

  String name

  String welcome
  String thankYou

  List groups
  static hasMany = [groups: QuestionGroup]

  String toString() {
    "$name [$id]"
  }

}
