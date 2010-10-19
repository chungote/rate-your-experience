
<%@ page import="transaction.Listing" %>
<%@ page import="notification.NotificationFlowState" %>
<%@ page import="org.ronintech.StringUtil"%>
          

            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
			                           
			                            <g:sortableColumn property="mlsNumber" title="${message(code: 'listing.mlsNumber.label', default: 'Mls Number')}" />
			                            <th>Status</th>
			                            <g:sortableColumn property="sellingAgentMlsId" title="${message(code: 'listing.sellingAgentMlsId.label', default: 'Selling Agent')}" />
			                            <g:sortableColumn property="buyerAgentMlsId" title="${message(code: 'listing.buyerAgentMlsId.label', default: 'Buyer Agent')}" />
			                        
			                            <g:sortableColumn property="streetAddress" title="${message(code: 'listing.streetAddress.label', default: 'Street Address')}" />
			                        
			                        <g:sortableColumn property="city" title="${message(code: 'listing.city.label', default: 'City')}" />
			
		
			                            <g:sortableColumn property="closedDate" title="${message(code: 'listing.closedDate.label', default: 'Closed Date')}" />
			                                                  
			                            <g:sortableColumn property="soldPrice" title="${message(code: 'listing.soldPrice.label', default: 'Sold Price')}" />
                           
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${listingInstanceList}" status="i" var="listingInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                                   <td>${fieldValue(bean: listingInstance, field: "mlsNumber")}</td>
                                   <g:set var='flowState' value="${listingInstance.transaction.notification?.flowState[0]}" />
                                  <td>
                                  
			       			<g:if test="${flowState==NotificationFlowState.START}">
							<g:link controller="surveyInvitationRequest" action="edit" id="${listingInstance.transaction.id}">Request<br/>Info<br/>from Agent</g:link></td>
                                   		   </g:if>
                                   		   
                                   		
			       			   <g:if test="${flowState==NotificationFlowState.INFORMATION_REQUESTED_FROM_AGENT}">
                                   			<g:link controller="surveyInvitationRequest" action="edit" id="${listingInstance.transaction.notification.surveyInvitationRequest.id[0]}">Info<br/>Requested<br/>from Agent</g:link>
                                   		   </g:if>   
                                   		   
                                   		    <g:if test="${flowState==NotificationFlowState.SURVEY_REQUESTED_FROM_CONSUMER}">
						   	 <g:link controller="surveyInvitationRequest" action="edit" id="${listingInstance.transaction.notification.surveyInvitationRequest.id[0]}">Survey<br/>Request<br/>Sent to<br/>Client</g:link>
						   </g:if>
						    <g:if test="${flowState==NotificationFlowState.SURVEY_COMPLETED_BY_CONSUMER}">
							 <g:link controller="surveyResponse" action="edit" id="${listingInstance.transaction.notification.surveyResponse.id[0]}">Survey<br/>Completed</g:link>
						   </g:if>
						    <g:if test="${flowState==NotificationFlowState.SURVEY_REVIEWED_BY_AGENT}">
							 <g:link controller="surveyResponse" action="show" id="${listingInstance.transaction.notification.surveyResponse.id[0]}">Survey<br/>Reviewed<br/>by Agent</g:link>
						   </g:if>
						    <g:if test="${flowState==NotificationFlowState.SURVEY_RELEASED_BY_ADMIN}">
						   	 <g:link controller="surveyResponse" action="show" id="${listingInstance.transaction.notification.surveyResponse.id[0]}">Survey<br/>Released</g:link>
						   </g:if>
				</td>		
						         <td>${fieldValue(bean: listingInstance, field: "sellingAgent.lastName")},<br/>${fieldValue(bean: listingInstance, field: "sellingAgent.firstName")}</td>
						          <td><g:link controller="agent" action="show" id="${buyerAgentMlsId}">${fieldValue(bean: listingInstance, field: "buyerAgentMlsId")}</g:link></td>
                         
			                           <td>${fieldValue(bean: listingInstance, field: "streetAddress")}</td>
			                               <td>${StringUtil.properCase(listingInstance.city)}</td>
				   			<td>${listingInstance.closedDate?.format("yyyy-MM-dd")}</td>
			                           
			                               <td>${fieldValue(bean: listingInstance, field: "soldPrice")}</td>
                            
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
     