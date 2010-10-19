@artifact.package@class @artifact.name@ {
	
    static constraints = {
    }
	
	Date dateCreated
	Date lastUpdated
	
	String toString() {
		"${this.class.name} $id"
	}
	
}
