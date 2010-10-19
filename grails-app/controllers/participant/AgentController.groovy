package participant

import org.ronintech.StringUtil
import security.Person

class AgentController {

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
        [agentInstanceList: Agent.list(params), agentInstanceTotal: Agent.count()]
    }

    def report = {
        //params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [agentInstanceList: Agent.list(params), agentInstanceTotal: Agent.count()]
    }
    def createAlternateContact = {
        if (!authenticateService.ifAnyGranted("ROLE_BROKER")) {
            redirect(action: "list")
            flash.message = "You are not authorized to set alternate contacts"
        }
        Person user = authenticateService.userDomain()
        def brokerInstance = user.getParticipant()

        [agentInstanceList: brokerInstance.agents]
    }

    def addAlternateContact = {
        if (!authenticateService.ifAnyGranted("ROLE_BROKER")) {
            redirect(action: "list")
            flash.message = "You are not authorized to set alternate contacts"
        }

        def agentList = params.agentList
        Person contact = Person.findByUserRealName(params.userRealName)
		if (agentList.getClass()== String[]){
			println agentList
            agentList.each() {
				if (!it.equals("null")) {

					def agent = Agent.get(it)
					agent.alternateContact = contact
					agent.save(flush: true)
				}
			}
        } else {
			def agent = Agent.get(agentList)
			agent.alternateContact = contact
            agent.save(flush: true)
		}
        redirect(controller:"home", action: "index")
        flash.message = "Alternate contact $params.userRealName set"
    }

/*
    def create = {
        def agentInstance = new Agent()
        agentInstance.properties = params
        return [agentInstance: agentInstance]
    }
*/
    def save = {
        def agentInstance = new Agent(params)
        if (agentInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'agent.label', default: 'Agent'), agentInstance.id])}"
            redirect(action: "list", id: agentInstance.id)
        }
        else {
            render(view: "create", model: [agentInstance: agentInstance])
        }
    }



    def edit = {
        if (authenticateService.ifAnyGranted("ROLE_AGENT")
                || authenticateService.ifAnyGranted("ROLE_ADMIN")) {

            def agentInstance = Agent.get(params.id)
            if (authenticateService.ifAnyGranted("ROLE_AGENT")) {
                Person user = authenticateService.userDomain()
                agentInstance = user.getParticipant()
            }
            if (!agentInstance) {
                flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'agent.label', default: 'Agent'), params.id])}"
                redirect(action: "editList")
            }
            else {
                return [agentInstance: agentInstance]
            }
        } else {
            flash.message = "You are not authorized to view this information"
            redirect(action: "editList")
        }
    }

    def update = {
        def agentInstance = Agent.get(params.id)
        if (agentInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (agentInstance.version > version) {

                    agentInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'agent.label', default: 'Agent')] as Object[], "Another user has updated this Agent while you were editing")
                    render(view: "edit", model: [agentInstance: agentInstance])
                    return
                }
            }
            agentInstance.properties = params
            if (!agentInstance.hasErrors() && agentInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'agent.label', default: 'Agent'), agentInstance.id])}"
                redirect(action: "editList", id: agentInstance.id)
            }
            else {
                render(view: "edit", model: [agentInstance: agentInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'agent.label', default: 'Agent'), params.id])}"
            redirect(action: "editList")
        }
    }
/*
    def delete = {
        def agentInstance = Agent.get(params.id)
        if (agentInstance) {
            try {
                agentInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'agent.label', default: 'Agent'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'agent.label', default: 'Agent'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'agent.label', default: 'Agent'), params.id])}"
            redirect(action: "list")
        }
    }
    */

    def show = {
        def agentInstance = Agent.get(params.id)
        Person user = authenticateService.userDomain()

            if (!agentInstance) {
					agentInstance = Agent.findByMlsAgentId(params.id)
				}

            if (!agentInstance) {

                flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'agent.label', default: 'Agent'), params.id])}"
                render(view: "error")
            }
          if (agentInstance && dataAccessService.isMyAgent(agentInstance, user) ) {

				[agentInstance: agentInstance,
				                surveyInvitationRequestInstanceList: agentInstance.surveyInvitationRequests?.sort {a, b -> if (a?.lastUpdated == null) { return 1} else {return -(a?.lastUpdated?.compareTo(b?.lastUpdated))}},
				                listingInstanceList: agentInstance.sellerListings?.sort {a, b -> if (a?.closedDate == null) { return 1} else {return -(a?.closedDate?.compareTo(b?.closedDate))}},
				                surveyResponseInstanceList: agentInstance.responses?.sort {a, b -> if (a?.lastUpdated == null) { return 1} else {return -(a?.lastUpdated?.compareTo(b?.lastUpdated))}}]

            } else if (agentInstance && !dataAccessService.isMyAgent(agentInstance, user) ){



                flash.message = "You are not authorized to view this agent's information"
                render(view: "error")
		}
    }

    def editListSearch = {AgentSearchCommand search ->

        params.max = Math.min(params.max ? params.int('max') : 10, 100)

        params.companyName = search.companyName;
        params.lastName = search.lastName;

        if (search?.companyName || search?.lastName) {

            render(template: "editList", model: [agentInstanceList: findAgents(search)])

        }
        else {
            render(template: "editList", model: [Agent.list(params)])
        }
    }

    def editList = {
        //params.max = Math.min(params.max ? params.int('max') : 10, 100)
        if (!params.sort) {
            params.sort = "lastName"
            params.order = "asc"
        }
        [agentInstanceList: Agent.list(params), agentInstanceTotal: Agent.count()]
    }

    def search = {
        def agentSearchInstance = new AgentSearchCommand()
        //responseSearchInstance.properties = params
        return [agentSearchInstance: agentSearchInstance]
    }

    def doSearch = {AgentSearchCommand search ->
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

        params.companyName = search.companyName;
        params.lastName = search.lastName;


        render(template: "list", model: [agentInstanceList: findAgents(search)])


    }

    def findAgents(AgentSearchCommand search) {
        def crit = Agent.createCriteria()
        def agents = crit.list {
            and {

                if (search?.companyName) {
                    ilike('companyName', search.companyName + "%")
                }
                if (search?.lastName) {
                    ilike('lastName', search.lastName + "%")
                }

                println "isBrokerRole=${authenticateService.ifAnyGranted("ROLE_BROKER")}"
                if (authenticateService.ifAnyGranted("ROLE_BROKER")) {
                    Person user = authenticateService.userDomain()
                    Broker myBroker = user.getParticipant()
                    println "myBroker.mlsMainOfficeId=${myBroker.mlsMainOfficeId}"

                    eq('mlsMainOfficeId', myBroker.mlsMainOfficeId)

                }

            } //and
        } //agents
        println "agents.size()=${agents.size()}"
        return agents.sort {it.lastName}


    }

    def searchAJAXUsers = {
        def field = "userRealName"

        println "inside search ajax users"

        def ajaxResults = Person.createCriteria().list(max: 10, sort: field, order: "asc") {
            Person user = authenticateService.userDomain()

            and {
                ilike(field, "${params.query}%")

                if (authenticateService.ifAnyGranted("ROLE_BROKER")) {


                    def inList = user.getParticipant().agents.id*.toInteger()
                    inList << user.getParticipant().id.toInteger()

                    'in'('participantId', inList)
                }
            }
        }


        renderAjaxResults(ajaxResults, field)
    }


    def renderAjaxResults(ajaxResults, field) {
        //Create XML response
        render(contentType: "text/xml") {
            results {
                ajaxResults.each { row ->
                    result {
                        name(row[field])
                        //Optional id which will be available in onItemSelect
                        id(row.id)
                    }
                }
            }
        }
    }

    def agentRatingChart = {
        def agent = Integer.valueOf(params.id)
        def chartValue = params.chartValue ?: "Average"
        def ret = getPercentsForAgent(agent, 'agent', chartValue)

        def questionTypes = queryService.findAllQuestionTypes("agent")

        def titleText = "Your ${chartValue} Ratings-${params?.questionType ?: 'Overall'}"

        if (params?.beginDate) {
            titleText += " from ${params?.beginDate.format('MM/dd/yy')}"
        }
        if (params?.endDate) {
            titleText += " thru ${params?.endDate.format('MM/dd/yy')}"
        }

        return [
                agent: agent,
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

    def serviceProviderRatingChart = {
        def agent = Integer.valueOf(params.id)
        def chartValue = params.chartValue ?: "Average"
        def providerType = params?.providerType ?: "all providers"
        def ret = getPercentsForAgent(agent, providerType, chartValue)

        def questionTypes = queryService.findAllQuestionTypes(providerType)
        def providerTypes = queryService.findAllServiceProviderTypes().collect {StringUtil.properCase(it)}

        def titleText = "${StringUtil.properCase(providerType)} ${chartValue} Ratings-${params?.questionType ?: 'Overall'}"

        if (params?.beginDate) {
            titleText += " from ${params?.beginDate.format('MM/dd/yy')}"
        }
        if (params?.endDate) {
            titleText += " thru ${params?.endDate.format('MM/dd/yy')}"
        }

        def model = [
                agent: agent,
                beginDate: params?.beginDate,
                endDate: params?.endDate,
                questionType: params?.questionType ?: "",
                providerType: params?.providerType ?: "",
                chartValue: chartValue,
                questionTypeList: questionTypes,
                providerTypeList: providerTypes,
                chartValueList: ["Average", "Low"],

                title: titleText.toString(),
                columns: [['string', 'Stars'], ['number', 'Your Ratings %']],
                data: [
                        ['1 star', ret.myPercents[0]],
                        ['2 stars', ret.myPercents[1]],
                        ['3 stars', ret.myPercents[2]],
                        ['4 stars', ret.myPercents[3]],
                        ['5 stars', ret.myPercents[4]]
                ]
        ]
        println "model=${model.dump()}"
        return model
    }



    private LinkedHashMap<String, List> getPercentsForAgent(agent, type, chartValue) {

        def func = 'avg'
        if (chartValue.toLowerCase() == 'low') {
            func = 'min'
        }
        def queryString = queryService.findAgentQuery(type, params, [func: func])

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
class AgentSearchCommand {

    static constraints = {
        companyName(nullable: true)
        lastName(nullable: true)


    }

    String lastName
    String companyName

}



