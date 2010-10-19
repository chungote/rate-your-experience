package system

import security.Person

class TermsOfService {

    static constraints = {
        type(inList: ["agent", "broker", "consumer", "service provider"])
        description(maxSize: 100, nullable: true)
        content(maxSize: 10000)
    }

    String content
    String type
    String description = "TOS ${new Date()}"
    Person modifiedBy
    Date dateCreated
    Date lastUpdated

    String toString() {
        "$type:$lastUpdated"
    }

}
