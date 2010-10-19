import security.Person
import security.Role
import system.*

/**
 * User controller.
 */
class PersonController {

    def authenticateService

    // the delete, save and update actions only accept POST requests
    static Map allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

    def index = {
        redirect action: list, params: params
    }

    def list = {
        if (!params.max) {
            params.max = 10
        }
        [personList: Person.list(params)]
    }



    def show = {
        def person = Person.get(params.id)
        if (!person) {
            flash.message = "Person not found with id $params.id"
            redirect action: list
            return
        }
        List roleNames = []
        for (role in person.authorities) {
            roleNames << role.authority
        }
        roleNames.sort {n1, n2 ->
            n1 <=> n2
        }
        [person: person, roleNames: roleNames]
    }

       def showCurrentTerms = {
	        def person = authenticateService.userDomain()
	        if (!person) {
	            flash.message = "Person not found with id $params.id"
	            redirect action: list
	            return
	        }
	        [person: person]
    }

    /**
     * Person delete action. Before removing an existing person,
     * he should be removed from those authorities which he is involved.
     */
     /*
    def delete = {

        def person = Person.get(params.id)
        if (person) {
            def authPrincipal = authenticateService.principal()
            //avoid self-delete if the logged-in user is an admin
            if (!(authPrincipal instanceof String) && authPrincipal.username == person.username) {
                flash.message = "You can not delete yourself, please login as another admin and try again"
            }
            else {
                //first, delete this person from People_Authorities table.
                Role.findAll().each { it.removeFromPeople(person) }
                person.delete()
                flash.message = "Person $params.id deleted."
            }
        }
        else {
            flash.message = "Person not found with id $params.id"
        }

        redirect action: list
    }
*/
    def edit = {

        def person = Person.get(params.id)
        if (!person) {
            flash.message = "Person not found with id $params.id"
            redirect action: list
            return
        }

        return buildPersonModel(person)
    }

    def changePassword = {

	        def person = Person.get(params.id)
	        Person user = authenticateService.userDomain()
	        if (person?.id!=user?.id){
				flash.message = "You are not authorized to change this person's password"
	            redirect action: list
	            return
	        }

	        if (!person) {
	            flash.message = "Person not found with id $params.id"
	            redirect action: list
	            return
	        }

	        return [person:person]
    }

      def updateList = {
			params.dump
	        def person = Person.get(params.id)
	        if (!person) {
	            flash.message = "Person not found with id $params.id"
	            redirect action: list
	            return
	        }

	        return
    }

   def updateTerms = {

		    def person = Person.get(params.id)
	        if (!person) {
	            flash.message = "Person not found with id $params.id"
	            redirect action: list
	            return
	        }
	        if(params.termsOfServiceId!=null) {

			person.termsOfServiceId=Integer.valueOf(params.termsOfServiceId)
				if (!person.hasErrors() && person.save(flush:true)){

				flash.message="Terms of Service Accepted"
	       		 redirect action: showCurrentTerms
			 } else{

				 redirect action: showCurrentTerms, model: [person:person]
			 }
	        }else {

				flash.message="You must accept the Terms of Service in order to use this application"
				redirect action: showCurrentTerms
			}
    }


    /**
     * Person update action.
     */
    def update = {

        def person = Person.get(params.id)
        if (!person) {
            flash.message = "Person not found with id $params.id"
            redirect action: edit, id: params.id
            return
        }

        long version = params.version.toLong()
        if (person.version > version) {
            person.errors.rejectValue 'version', "person.optimistic.locking.failure",
                    "Another user has updated this Person while you were editing."
            render view: 'edit', model: buildPersonModel(person)
            return
        }

        def oldPassword = person.passwd
        person.properties = params
        if (!params.passwd.equals(oldPassword)) {
            person.passwd = authenticateService.encodePassword(params.passwd)
        }
        if (person.save()) {
            Role.findAll().each { it.removeFromPeople(person) }
            addRoles(person)
            redirect action: edit, id: person.id
        }
        else {
			flash.message="an error has occurred"
            render view: 'edit', model: buildPersonModel(person)
        }
    }

     def updatePassword = {
	        def person = Person.get(params.id)
	        if (!person) {
	            flash.message = "Person not found with id $params.id"
	            redirect action: edit, id: params.id
	            return
	        }

	        long version = params.version.toLong()
	        if (person.version > version) {
	            person.errors.rejectValue 'version', "person.optimistic.locking.failure",
	                    "Another user has updated this Person while you were editing."
	            render view: 'edit', model: buildPersonModel(person)
	            return
	        }
        	 person.passwd = authenticateService.encodePassword(params.pass)

	        println"person=${person.dump()}"
	        if (person.save()) {
				flash.message="Password Changed"
	            redirect action: changePassword, id: person.id
	        }
	        else {
				flash.message="an error has occurred"
	            render view: 'edit', model: buildPersonModel(person)
	        }
    }

   def createBrokerStaff = {
	    	Person user = authenticateService.userDomain()
	        def brokerInstance = user.getParticipant()
        [person: new Person(params), brokerInstance:brokerInstance,authorityList: Role.list().findAll{it.authority=="ROLE_BROKER"}.sort {it.authority}]
    }


    def create = {
		def person=new Person(params)
		def configList=Config.list()
		def config=configList[0]
		if (config.systemOpting.equals("opt in")){
			person.optIn=true
		} else {
			person.optIn=false
		}
        [person: person, authorityList: Role.list().sort {it.authority}]
    }

    /**
     * Person save action.
     */
    def save = {

        def person = new Person()
        person.properties = params
        person.passwd = authenticateService.encodePassword(params.passwd)
        if (person.save()) {
            addRoles(person)
            redirect action: edit, id: person.id
        }
        else {
            render view: 'create', model: [authorityList: Role.list().sort {it.authority}, person: person]
        }
    }

    private void addRoles(person) {
        for (String key in params.keySet()) {
            if (key.contains('ROLE') && 'on' == params.get(key)) {
                Role.findByAuthority(key).addToPeople(person)
            }
        }
    }

    private Map buildPersonModel(person) {

        List roles = Role.list()
        roles.sort {r1, r2 ->
            r1.authority <=> r2.authority
        }
        Set userRoleNames = []
        for (role in person.authorities) {
            userRoleNames << role.authority
        }
        LinkedHashMap<Role, Boolean> roleMap = [:]
        for (role in roles) {
            roleMap[(role)] = userRoleNames.contains(role.authority)
        }

        return [person: person, roleMap: roleMap]
    }
   def search = {
  	    def personSearchInstance = new PersonSearchCommand()
  	    //responseSearchInstance.properties = params
  	    return [personSearchInstance: personSearchInstance]
  	  }

  	  def doSearch = {PersonSearchCommand search ->
  	    params.max = Math.min(params.max ? params.int('max') : 10, 100)

  	    params.username = search.username;
  		params.userRealName=search.userRealName;
  		params.email=search.email;

  	    if (search?.username||search?.userRealName||search?.email) {

  	      render(template: "list", model: [personList: findPersons(search)])

  	    }
  	    else {
  	      render(template: "list", model: [Person.list(params)])
  	    }
  	  }

  	  def findPersons(PersonSearchCommand search) {
  	    def crit = Person.createCriteria()
  	      def persons = crit {
  				and{
  	         	 if (search?.username) {

  			 	  ilike('username', search.username+"%")
  	          	}
  	          	if (search?.userRealName) {

				  ilike('userRealName', "%"+search.userRealName+"%")
  	          	}
  	          	 if (search?.email) {

					  ilike('email', search.email+"%")
  	          	}
  			}

  	       }


  	    return persons.sort{it.username}
  	  }
  }


  	class PersonSearchCommand {

  	  static constraints = {
  	    username(nullable: true)
  	    userRealName(nullable:true)
  	    email(nullable:true)

  	  }

  	  String username
  	  String userRealName
  	  String email

  	}


