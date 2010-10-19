package security

import notification.Notification
import notification.SurveyInvitationRequest
import participant.Agent
import participant.Broker
import participant.ServiceProvider
import survey.SurveyResponse
import transaction.Listing

class DataAccessService {

    boolean transactional = true

    def isMyAgent(Agent agent, Person person) {

        switch (person.type) {
            case "admin":
                return true
                break

            case "broker":
                Broker broker = person.getParticipant()
                if (broker.isMyAgent(agent)) {
                    return true
                } else {
                    return false
                }
                break

            case "agent":
                Agent myAgent = person.getParticipant()
                if (myAgent == agent) {
                    return true
                } else {
                    return false
                }
                break

            default:
                return false
        }
    }

    def isMyListing(Listing listing, Person person) {

		def agents=getAlternateContactList(person)
		        if (agents!=null&&agents.size () >0) {
		            agents.each() {
		                def agent = Agent.get(it.id)
		                if (agent.isMyListing(listing)) {
		                    return true
		                }
		            }
        }

        switch (person.type) {
            case "admin":
                return true
                break

            case "broker":
                Broker broker = person.getParticipant()
                if (broker.isMyListing(listing)) {
                    return true
                } else {
                    return false

                }
                break

            case "agent":
                Agent agent = person.getParticipant()
                if (agent.isMyListing(listing)) {
                    return true
                } else {
                    return false
                }
                break

            default:
                return false

        }

    }


    def isMyResponse(SurveyResponse response, Person person) {

    def agents=getAlternateContactList(person)
	        if (agents!=null&&agents.size () >0) {
	            agents.each() {
	                def agent = Agent.get(it.id)
	                if (agent.isMyResponse(response)) {
	                    return true
	                }
	            }
        }

        switch (person.type) {
            case "admin":
                return true
                break

            case "broker":
                Broker broker = person.getParticipant()
                if (broker.isMyResponse(response)) {
                    return true
                } else {
                    return false

                }
                break

            case "agent":
                Agent agent = person.getParticipant()
                if (agent.isMyResponse(response)) {
                    return true
                } else {
                    return false
                }
                break

            case "provider":
		                   ServiceProvider provider = person.getParticipant()
		                   if (provider.isMyResponse(response)) {
		                       return true
		                   } else {
		                       return false
		                   }
                break

            default:
               return false

        }

    }

    def isMyInvitation(SurveyInvitationRequest invitation, Person person) {
println "inside data access service invitation request start"
        def agents=getAlternateContactList(person)
		        if (agents!=null&&agents.size () >0) {
					println "inside survey invitation looking for alternate contacts"
		            agents.each() {
		                def agent = Agent.get(it.id)
		                if (agent.isMyInvitation(invitation)) {
		                    return true
		                }
		            }
        }

        switch (person.type) {
            case "admin":
                return true
                break

            case "broker":
                Broker broker = person.getParticipant()

                if (broker.isMyInvitation(invitation)) {
                    return true
                } else {
                    return false

                }
                break

            case "agent":


                Agent agent = person.getParticipant()

                if(agent.broker.centralizedResponder!=null && person==broker.centralizedResponder){

					return agent.broker.isMyInvitation(invitation)
				}

                if (agent.isMyInvitation(invitation)) {

                    return true
                }

                break

            default:
                return false

        }

    }

    def isMyNotification(Notification notification, Person person) {

		def agents=getAlternateContactList(person)
        if (agents!=null&&agents.size () >0) {
            agents.each() {
                def agent = Agent.get(it.id)
                if (agent.isMyNotification(notification)) {
                    return true
                }
            }
        }

        switch (person.type) {
            case "admin":
                return true
                break

            case "broker":
                Broker broker = person.getParticipant()
                if (broker.isMyNotification(notification)) {
                    return true
                }
                break
            default:
                return false

            case "agent":
                Agent agent = person.getParticipant()
                if (agent.isMyNotification(notification)) {
                    return true
                } else {
                    return false
                }
                break

            default:
                return false

        }

    }

    def getAlternateContactList(Person person) {
        def crit = Agent.createCriteria()
        def agents = crit {
            and {

                eq('alternateContact', person)
            }
        }
        return agents
    }

}
