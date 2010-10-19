package notification
import transaction.Listing
import survey.*
import participant.*
import security.*

class NotificationStatisticsService {
	def sessionFactory

Integer informationRequestPendingTotal
Integer surveyPendingTotal
Integer adminApprovalPendingTotal
Integer agentNonResponderTotal
Integer flaggedReviewTotal
List agentNonResponders
List informationRequestPendingList
List surveyPendingList
List reviewPendingList
List agentNonResponderList
List flaggedReviewList

Integer getInformationRequestPendingTotal(Person user) {
switch ( user.type ) {
		    case "admin":
	        	def ret=Notification.executeQuery('select count(*) from Notification where flowState=\'INFORMATION_REQUESTED_FROM_AGENT\'')
				return ret[0]
	        	break

	        case "agent":

	            def hSession = sessionFactory.getCurrentSession()
		        def queryString="""select count(*) from notification,agent,listing,retransaction
				where notification.flow_state='INFORMATION_REQUESTED_FROM_AGENT'
				and agent.mls_agent_id=listing.selling_agent_mls_id
				and listing.id=retransaction.listing_id
				and retransaction.id=notification.transaction_id
				and agent.id=${user.participantId}"""
		        def query = hSession.createSQLQuery(queryString)
		        def ret=query.list()
		        return ret[0]
		        break

	        case "broker":
	            def hSession = sessionFactory.getCurrentSession()
	        	def queryString="""select count(*) from notification,agent,listing,retransaction,broker
				where notification.flow_state='INFORMATION_REQUESTED_FROM_AGENT'
				and agent.mls_agent_id=listing.selling_agent_mls_id
				and broker.mls_main_office_id=agent.mls_main_office_id
				and listing.id=retransaction.listing_id
				and retransaction.id=notification.transaction_id
				and broker.id=${user.participantId}"""
		        def query = hSession.createSQLQuery(queryString)
		        def ret=query.list()
		        return ret[0]
		        break

	        case "provider":
	        	return ServiceProvider.get(participantId)
	        	break

		}



}

List getInformationRequestPendingList(Person user) {
switch ( user.type ) {
		    case "admin":

			            def hSession = sessionFactory.getCurrentSession()
				        def queryString="""select survey_invitation_request_id from notification where
						flow_state='INFORMATION_REQUESTED_FROM_AGENT'
					"""
				        def query = hSession.createSQLQuery(queryString)
				        def ret=query.list()
				        return ret
				        break

	        case "agent":

	            def hSession = sessionFactory.getCurrentSession()
		        def queryString="""select notification.survey_invitation_request_id from notification,agent,listing,retransaction
				where notification.flow_state='INFORMATION_REQUESTED_FROM_AGENT'
				and agent.mls_agent_id=listing.selling_agent_mls_id
				and listing.id=retransaction.listing_id
				and retransaction.id=notification.transaction_id
				and agent.id=${user.participantId}"""
		        def query = hSession.createSQLQuery(queryString)
		        def ret=query.list()
		        return ret
		        break

	        case "broker":
	            def hSession = sessionFactory.getCurrentSession()
	        	def queryString="""select notification.survey_invitation_request_id from notification,agent,listing,retransaction,broker
				where notification.flow_state='INFORMATION_REQUESTED_FROM_AGENT'
				and agent.mls_agent_id=listing.selling_agent_mls_id
				and broker.mls_main_office_id=agent.mls_main_office_id
				and listing.id=retransaction.listing_id
				and retransaction.id=notification.transaction_id
				and broker.id=${user.participantId}"""
		        def query = hSession.createSQLQuery(queryString)
		        def ret=query.list()
		        return ret
		        break

	        case "provider":
	        	return ServiceProvider.get(participantId)
	        	break

		}



}


Integer getSurveyPendingTotal(Person user) {
switch ( user.type ) {
		    case "admin":

			def ret=Notification.executeQuery('select count(*) from Notification where flowState=\'SURVEY_REQUESTED_FROM_CONSUMER\'')
			return ret[0]
	        	break

	        case "agent":

	            def hSession = sessionFactory.getCurrentSession()
		        def queryString="""select count(*) from notification,agent,listing,retransaction
				where notification.flow_state='SURVEY_REQUESTED_FROM_CONSUMER'
				and agent.mls_agent_id=listing.selling_agent_mls_id
				and listing.id=retransaction.listing_id
				and retransaction.id=notification.transaction_id
				and agent.id=${user.participantId}"""
		        def query = hSession.createSQLQuery(queryString)
		        def ret=query.list()
		        return ret[0]
		        break

	        case "broker":
	            def hSession = sessionFactory.getCurrentSession()
	        	def queryString="""select count(*) from notification,agent,listing,retransaction,broker
				where notification.flow_state='SURVEY_REQUESTED_FROM_CONSUMER'
				and agent.mls_agent_id=listing.selling_agent_mls_id
				and broker.mls_main_office_id=agent.mls_main_office_id
				and listing.id=retransaction.listing_id
				and retransaction.id=notification.transaction_id
				and broker.id=${user.participantId}"""
		        def query = hSession.createSQLQuery(queryString)
		        def ret=query.list()
		        return ret[0]
		        break

	        case "provider":
	        	return ServiceProvider.get(participantId)
	        	break

		}




}

List getSurveyPendingList(Person user) {
switch ( user.type ) {
		    case "admin":

			 def hSession = sessionFactory.getCurrentSession()
					        def queryString="""select survey_invitation_request_id from notification
							where flow_state='SURVEY_REQUESTED_FROM_CONSUMER'
							"""
					        def query = hSession.createSQLQuery(queryString)
					        def ret=query.list()
					        return ret
		        break

	        case "agent":

	            def hSession = sessionFactory.getCurrentSession()
		        def queryString="""select notification.survey_invitation_request_id from notification,agent,listing,retransaction
				where notification.flow_state='SURVEY_REQUESTED_FROM_CONSUMER'
				and agent.mls_agent_id=listing.selling_agent_mls_id
				and listing.id=retransaction.listing_id
				and retransaction.id=notification.transaction_id
				and agent.id=${user.participantId}"""
		        def query = hSession.createSQLQuery(queryString)
		        def ret=query.list()
		        return ret
		        break

	        case "broker":
	            def hSession = sessionFactory.getCurrentSession()
	        	def queryString="""select notification.survey_invitation_request_id from notification,agent,listing,retransaction,broker
				where notification.flow_state='SURVEY_REQUESTED_FROM_CONSUMER'
				and agent.mls_agent_id=listing.selling_agent_mls_id
				and broker.mls_main_office_id=agent.mls_main_office_id
				and listing.id=retransaction.listing_id
				and retransaction.id=notification.transaction_id
				and broker.id=${user.participantId}"""
		        def query = hSession.createSQLQuery(queryString)
		        def ret=query.list()
		        return ret
		        break

	        case "provider":
	        	return ServiceProvider.get(participantId)
	        	break

		}




}

Integer getReviewPendingTotal(Person user) {
switch ( user.type ) {
		    case "admin":
			def ret=Notification.executeQuery('select count(*) from Notification where flowState=\'SURVEY_REVIEWED_BY_AGENT\'')
			return ret[0]
	        	break

	        case "agent":

	            def hSession = sessionFactory.getCurrentSession()
		        def queryString="""select count(*) from notification,agent,listing,retransaction
				where notification.flow_state='SURVEY_COMPLETED_BY_CONSUMER'
				and agent.mls_agent_id=listing.selling_agent_mls_id
				and listing.id=retransaction.listing_id
				and retransaction.id=notification.transaction_id
				and agent.id=${user.participantId}"""
		        def query = hSession.createSQLQuery(queryString)
		        def ret=query.list()
		        return ret[0]
		        break

	        case "broker":
	            def hSession = sessionFactory.getCurrentSession()
	        	def queryString="""select count(*) from notification,agent,listing,retransaction,broker
				where notification.flow_state='SURVEY_COMPLETED_BY_CONSUMER'
				and agent.mls_agent_id=listing.selling_agent_mls_id
				and broker.mls_main_office_id=agent.mls_main_office_id
				and listing.id=retransaction.listing_id
				and retransaction.id=notification.transaction_id
				and broker.id=${user.participantId}"""
		        def query = hSession.createSQLQuery(queryString)
		        def ret=query.list()
		        return ret[0]
		        break

	        case "provider":
	        	return ServiceProvider.get(participantId)
	        	break

		}
	}


List getReviewPendingList(Person user) {
switch ( user.type ) {
		    case "admin":
			 def hSession = sessionFactory.getCurrentSession()
					def queryString="""select survey_response_id from notification
					where flow_state='SURVEY_REVIEWED_BY_AGENT'
					"""
					def query = hSession.createSQLQuery(queryString)
					def ret=query.list()
					return ret
				break

	        case "agent":

	            def hSession = sessionFactory.getCurrentSession()
		        def queryString="""select notification.survey_response_id from notification,agent,listing,retransaction
				where notification.flow_state='SURVEY_COMPLETED_BY_CONSUMER'
				and agent.mls_agent_id=listing.selling_agent_mls_id
				and listing.id=retransaction.listing_id
				and retransaction.id=notification.transaction_id
				and agent.id=${user.participantId}"""
		        def query = hSession.createSQLQuery(queryString)
		        def ret=query.list()
		        return ret
		        break

	        case "broker":
	            def hSession = sessionFactory.getCurrentSession()
	        	def queryString="""select notification.survey_response_id from notification,agent,listing,retransaction,broker
				where notification.flow_state='SURVEY_COMPLETED_BY_CONSUMER'
				and agent.mls_agent_id=listing.selling_agent_mls_id
				and broker.mls_main_office_id=agent.mls_main_office_id
				and listing.id=retransaction.listing_id
				and retransaction.id=notification.transaction_id
				and broker.id=${user.participantId}"""
		        def query = hSession.createSQLQuery(queryString)
		        def ret=query.list()
		        return ret
		        break

	        case "provider":
	        	return ServiceProvider.get(participantId)
	        	break

		}




}



Integer getAdminApprovalPendingTotal() {
	def ret=Notification.executeQuery('select count(*) from Notification where flowState=\'SURVEY_REVIEWED_BY_AGENT\'')
	return ret[0]

}

List getAgentNonResponders() {

	def ret=Notification.findAllByFlowStateAndInformationSecondDueDateFlag('INFORMATION_REQUESTED_FROM_AGENT',true)
	return ret

}

Integer getAgentNonResponderTotal(Person user) {
switch ( user.type ) {
		    case "admin":
			def ret=Notification.executeQuery('select count(*) from Notification where flowState=\'INFORMATION_REQUESTED_FROM_AGENT\' and informationSecondDueDateFlag=1')
			return ret[0]
	        	break

	        case "agent":

	            def hSession = sessionFactory.getCurrentSession()
		        def queryString="""select count(*) from notification,agent,listing,retransaction
				where notification.flow_state='INFORMATION_REQUESTED_FROM_AGENT'
				and information_second_due_date_flag=1
				and agent.mls_agent_id=listing.selling_agent_mls_id
				and listing.id=retransaction.listing_id
				and retransaction.id=notification.transaction_id
				and agent.id=${user.participantId}"""
		        def query = hSession.createSQLQuery(queryString)
		        def ret=query.list()
		        return ret[0]
		        break

	        case "broker":
	            def hSession = sessionFactory.getCurrentSession()
	        	def queryString="""select count(*) from notification,agent,listing,retransaction,broker
				where notification.flow_state='INFORMATION_REQUESTED_FROM_AGENT'
				and information_second_due_date_flag=1
				and agent.mls_agent_id=listing.selling_agent_mls_id
				and broker.mls_main_office_id=agent.mls_main_office_id
				and listing.id=retransaction.listing_id
				and retransaction.id=notification.transaction_id
				and broker.id=${user.participantId}"""
		        def query = hSession.createSQLQuery(queryString)
		        def ret=query.list()
		        return ret[0]
		        break

	        case "provider":
	        	return null
	        	break

		}
}




List getFlaggedReviewList(Person user) {
switch ( user.type ) {

	        case "admin":
		          def hSession = sessionFactory.getCurrentSession()
		        def queryString="""select distinct survey_response_responses_id from
				survey_response_question_response,
				question_response,
				reviewer_comment_flag
				where reviewer_comment_flag.question_response_id=question_response.id
				and question_response.id=survey_response_question_response.question_response_id
				and flag=1
				and reviewed_by_id is null

				"""
		        def query = hSession.createSQLQuery(queryString)
		        def ret=query.list()
		        return ret
		        break

		}



}

Integer getFlaggedReviewTotal(Person user) {
switch ( user.type ) {

	        case "admin":

	            def hSession = sessionFactory.getCurrentSession()
		        def queryString="""select count(distinct survey_response_responses_id) from
				survey_response_question_response,
				question_response,
				reviewer_comment_flag
				where reviewer_comment_flag.question_response_id=question_response.id
				and question_response.id=survey_response_question_response.question_response_id
				and flag=1
				and reviewed_by_id is null

				"""
		        def query = hSession.createSQLQuery(queryString)
		        def ret=query.list()
		        return ret[0]
		        break

		}



}



}