package system

import security.Person

class PrivacyPolicy {

    static constraints = {
        description(maxSize: 100, nullable: true)
        content(maxSize: 10000)
    }

    String content
    String description = "TOS ${new Date()}"
    Person modifiedBy
    Date dateCreated
    Date lastUpdated

    String toString() {
        "${this.class.name} $id"
    }

}
