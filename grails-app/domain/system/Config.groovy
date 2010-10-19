package system

class Config {

    static constraints = {
		moderation(nullable:true)
		emailFlaggedReview(nullable:true)
		systemOpting(inList: ["opt in","opt out"])

    }
	Boolean moderation=false
	Boolean emailFlaggedReview=false
	String systemOpting
	Date dateCreated
	Date lastUpdated

	String toString() {
		"${this.class.name} $id"
	}

}

