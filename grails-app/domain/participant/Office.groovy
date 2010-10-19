package participant

class Office {
  String officeName
  String contactName
  String mlsOfficeId
  String mlsMainOfficeId
  String mlsBrokerId
  String mlsStatus
  String streetAddress1
  String streetAddress2
  String streetAddress3
  String city
  String stateOrProvince
  String zip
  String officePhone
  String fax
  String email
  String webPage
    static constraints = {
  officeName(maxSize:150,nullable:true)
  contactName(maxSize:100,nullable:true)
  mlsOfficeId(maxSize:25,nullable:true)
  mlsMainOfficeId(maxSize:25,nullable:true)
  mlsBrokerId(maxSize:25,nullable:true)
  streetAddress1(maxSize:150,nullable:true)
  streetAddress2(maxSize:150,nullable:true)
  streetAddress3(maxSize:150,nullable:true)
  city(maxSize:100,nullable:true)
  stateOrProvince(maxSize:50,nullable:true)
  zip(maxSize:20,nullable:true)
  officePhone(maxSize:20,nullable:true)
  fax(maxSize:20,nullable:true)
  email(maxSize:200,nullable:true)
  webPage(maxSize:500,nullable:true)

    }

  static transients = [
    "agents"
  ]
	Date dateCreated
	Date lastUpdated

	String toString() {
		"${officeName}:${mlsOfficeId}"
	}

  def getAgents(){
    Agent.findAllByMlsOfficeId(mlsOfficeId)
  }

}
