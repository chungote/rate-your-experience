package survey

/**
 * code: This code must be unique for all groups within the survey as it is used to identify each group (mandatory)
 * name: The name of the group, this is displayed as the group heading (mandatory)
 * description: Give a more detailed description/instructions for the group (optional)
 * questions: Defines all the questions contained within this group (mandatory)
 *
 *
 * @author jbrush
 *
 */
class QuestionGroup {
    static mapping = {
        sort "sortOrder"
        questions fetch: 'join'
    }
    static constraints = {
        survey()
        type(nullable: true, inList: SERVICE_PROVIDER_TYPE_LIST)
        sortOrder(max: 999)
        name(maxSize: 255)
        description(maxSize: 255)
        questions()
        dateCreated()
        lastUpdated()
    }

    static transients = ['SERVICE_PROVIDER_TYPE_LIST']

    Date dateCreated
    Date lastUpdated

    final static List SERVICE_PROVIDER_TYPE_LIST = ["demographics", "agent", "attorney", "house inspector", "lender", "mold inspector", "radon inspector", "termite inspector"]

    int sortOrder
    String name
    String description
    String type

    List questions
    static hasMany = [questions: Question]
    static belongsTo = [survey: Survey]

    String toString() {
        "$name"
    }

}
