package participant
import security.*
class ServiceProviderController {
	  def authenticateService
	    def dataAccessService
	    def queryService
	    def sessionFactory


  static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

  def index = {
    redirect(action: "list", params: params)
  }

  def list = {
    //params.max = Math.min(params.max ? params.int('max') : 10, 100)
    [serviceProviderInstanceList: ServiceProvider.list(params), serviceProviderInstanceTotal: ServiceProvider.count()]
  }

    def editList = {
      //params.max = Math.min(params.max ? params.int('max') : 10, 100)
      [serviceProviderInstanceList: ServiceProvider.list(params), serviceProviderInstanceTotal: ServiceProvider.count()]
    }


  def create = {
    def serviceProviderInstance = new ServiceProvider()
    serviceProviderInstance.properties = params
    return [serviceProviderInstance: serviceProviderInstance]
  }

  def save = {

    def serviceProviderInstance = new ServiceProvider(params)
    Person user = authenticateService.userDomain()
    serviceProviderInstance.lookupName=serviceProviderInstance.firstName+" "+serviceProviderInstance.lastName
    serviceProviderInstance.modifiedBy=user
    if (serviceProviderInstance.save(flush: true)) {
      flash.message = "${message(code: 'default.created.message', args: [message(code: 'serviceProvider.label', default: 'ServiceProvider'), serviceProviderInstance.toString()])}"

      redirect(action: "show", id: serviceProviderInstance.id)
    }
    else {
      render(view: "create", model: [serviceProviderInstance: serviceProviderInstance])
    }
  }

  def show = {
    def serviceProviderInstance = ServiceProvider.get(params.id)

         Person user = authenticateService.userDomain()
	      if (authenticateService.ifAnyGranted("ROLE_PROVIDER")) {
				def myProvider = user.getParticipant()
				if (myProvider.id !=serviceProviderInstance.id) {
					println "not me"
				flash.message = "You are not authorized to view information for ${serviceProviderInstance.companyName}"
	      		redirect(controller: "home", action: "index")
			}
		}


    if (!serviceProviderInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'serviceProvider.label', default: 'ServiceProvider'), params.id])}"
      redirect(action: "list")
    }
    else {
		[serviceProviderInstance: serviceProviderInstance,
		  surveyResponseInstanceList: serviceProviderInstance.responses?.sort {a, b -> if (a?.lastUpdated == null) { return 1} else {return -(a?.lastUpdated?.compareTo(b?.lastUpdated))}}]


    }
  }

  def edit = {
    def serviceProviderInstance = ServiceProvider.get(params.id)
         Person user = authenticateService.userDomain()
	      if (authenticateService.ifAnyGranted("ROLE_PROVIDER")) {
				def myProvider = user.getParticipant()
				if (myProvider.id !=serviceProviderInstance.id) {
				flash.message = "You are not authorized to edit information for ${serviceProviderInstance.companyName}"
	      		redirect(controller: "home", action: "index")
			}
		}




	    if (!serviceProviderInstance) {
	      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'serviceProvider.label', default: 'ServiceProvider'), params.id])}"
	      redirect(action: "list")
	    }


    if (!serviceProviderInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'serviceProvider.label', default: 'ServiceProvider'), params.id])}"
      redirect(action: "list")
    }
    else {
      return [serviceProviderInstance: serviceProviderInstance]
    }
  }

  def update = {
    def serviceProviderInstance = ServiceProvider.get(params.id)
    if (serviceProviderInstance) {
      if (params.version) {
        def version = params.version.toLong()
        if (serviceProviderInstance.version > version) {

          serviceProviderInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'serviceProvider.label', default: 'ServiceProvider')] as Object[], "Another user has updated this ServiceProvider while you were editing")
          render(view: "edit", model: [serviceProviderInstance: serviceProviderInstance])
          return
        }
      }
      serviceProviderInstance.properties = params
      if (!serviceProviderInstance.hasErrors() && serviceProviderInstance.save(flush: true)) {
        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'serviceProvider.label', default: 'ServiceProvider'), serviceProviderInstance.id])}"
        redirect(action: "show", id: serviceProviderInstance.id)
      }
      else {
        render(view: "edit", model: [serviceProviderInstance: serviceProviderInstance])
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'serviceProvider.label', default: 'ServiceProvider'), params.id])}"
      redirect(action: "list")
    }
  }
/*
  def delete = {
    def serviceProviderInstance = ServiceProvider.get(params.id)
    if (serviceProviderInstance) {
      try {
        serviceProviderInstance.delete(flush: true)
        flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'serviceProvider.label', default: 'ServiceProvider'), params.id])}"
        redirect(action: "list")
      }
      catch (org.springframework.dao.DataIntegrityViolationException e) {
        flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'serviceProvider.label', default: 'ServiceProvider'), params.id])}"
        redirect(action: "show", id: params.id)
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'serviceProvider.label', default: 'ServiceProvider'), params.id])}"
      redirect(action: "list")
    }
  }
  */
  def search = {
    	    def serviceProviderSearchInstance = new ServiceProviderSearchCommand()
    	    //responseSearchInstance.properties = params
    	    return [serviceProviderSearchInstance: serviceProviderSearchInstance]
    	  }



   def doSearch = {ServiceProviderSearchCommand search ->
    	    params.max = Math.min(params.max ? params.int('max') : 10, 100)

    	    params.companyName = search.companyName;
    		params.lastName=search.lastName;
    		params.firstName=search.firstName;


    	      render(template: "list", model: [serviceProviderInstanceList: findProviders(search)])


  }

   def editSearch = {
      	    def serviceProviderSearchInstance = new ServiceProviderSearchCommand()
      	    //responseSearchInstance.properties = params
      	    return [serviceProviderSearchInstance: serviceProviderSearchInstance]
      	  }



     def doEditSearch = {ServiceProviderSearchCommand search ->
      	    params.max = Math.min(params.max ? params.int('max') : 10, 100)

      	    params.companyName = search.companyName;
      		params.lastName=search.lastName;
      		params.firstName=search.firstName;


      	      render(template: "editList", model: [serviceProviderInstanceList: findProviders(search)])


  }

  def findProviders(ServiceProviderSearchCommand search) {
    	    def crit = ServiceProvider.createCriteria()
    		def providers = crit.list {
    			and{

    				if (search?.companyName) {
    			 	  ilike('companyName', search.companyName+"%")
    	          	}
    	          	if (search?.lastName) {
  				  ilike('lastName', search.lastName+"%")
    	          	}
  			  	if (search?.firstName) {
    				  ilike('firstName', search.firstName+"%")
      	          	}


    			} //and
  		} //providers
    	    return providers.sort{it.lastName}


   }






   def serviceProviderRatingChart = {
          def serviceProvider = Integer.valueOf(params.id)
          def serviceProviderInstance=ServiceProvider.get(serviceProvider)
          def chartValue = params.chartValue ?: "Average"
          def ret = getPercentsForProvider(serviceProvider, serviceProviderInstance?.type, chartValue)

          def questionTypes = queryService.findAllQuestionTypes(serviceProviderInstance?.type)

          def titleText = "Your ${chartValue} Ratings-${params?.questionType ?: 'Overall'}"

          if (params?.beginDate) {
              titleText += " from ${params?.beginDate.format('MM/dd/yy')}"
          }
          if (params?.endDate) {
              titleText += " thru ${params?.endDate.format('MM/dd/yy')}"
          }

          return [
                  serviceProvider: serviceProvider,
                  beginDate: params.beginDate,
                  endDate: params.endDate,
                  questionType: params?.questionType ?: "",
                  chartValue: chartValue,
                  questionTypeList: questionTypes,
                  chartValueList: ["Average", "Low"],

                  //chart: [
                  title: titleText.toString(),
                  columns: [['string', 'Stars'], ['number', 'Your Ratings %']],
                  data: [
                          ['1 star', ret.myPercents[0]],
                          ['2 stars', ret.myPercents[1]],
                          ['3 stars', ret.myPercents[2]],
                          ['4 stars', ret.myPercents[3]],
                          ['5 stars', ret.myPercents[4]]
                  ]
                  //]
          ]
      }



    private LinkedHashMap<String, List> getPercentsForProvider(serviceProvider, type, chartValue) {

        def func = 'avg'
        if (chartValue.toLowerCase() == 'low') {
            func = 'min'
        }
        def queryString = queryService.findProviderQuery(type, params, [func: func])

        def hSession = sessionFactory.getCurrentSession()
        def query = hSession.createSQLQuery(queryString).
                addScalar("rating").
                addScalar("id")
        def pos = 0
        if (params.beginDate && params.endDate) {
            // "and n.survey_completed_date between ? and ?"
            query.setDate(pos++, params.beginDate)
            query.setDate(pos++, params.endDate)
        }
        else if (params.beginDate) {
            //"and n.survey_completed_date >= ?"
            query.setDate(pos++, params.beginDate)
        }
        else if (params.endDate) {
            // "and n.survey_completed_date <= ?"
            query.setDate(pos++, params.endDate)
        }

        if (params.questionType) {
            // "and q.header = ?"
            query.setString(pos++, params.questionType)
        }

        query.setLong(pos++, params.id.toLong())

        def results = query.list()

        def myCounts = [:]
        def myTotalCount = 0
        println "results=${results}"
        results.each() {row ->
            if (row[0]) { // if there is a non-null rating
                def bin = mapToBin(row[0])
                myCounts.put(bin, 1 + (myCounts.get(bin, 0)))
                myTotalCount++
            }
        }
        def myPercents = []

        // convert to percents
        1.upto(5) { i ->
            myPercents[i - 1] = 0
            if (myTotalCount) { // don't div by zero
                myPercents[i - 1] = (myCounts.get(i.toString(), 0.0) * 100.0 / myTotalCount).toInteger()
            }
        }

        return [myPercents: myPercents]
    }

    String mapToBin(rating) {

        return (rating + 0.5).toInteger().toString()
    }


}

  	class ServiceProviderSearchCommand {

  	  static constraints = {
  	    companyName(nullable: true)
  	    lastName(nullable:true)
  	     firstName(nullable:true)
  	  }
  	  String companyName
  	  String lastName
  	  String firstName
  }