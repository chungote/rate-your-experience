<%@ page import="notification.SurveyInvitationRequest" %>


<div class="list">
  <table>
    <thead>
    <tr>

      <th><g:message code="surveyInvitationRequest.notification.listing.mlsNumber.label" default="MLS Number"/></th>
      <th><g:message code="surveyInvitationRequest.notification.listing.sellingAgent.label" default="Agent"/></th>
      <g:sortableColumn property="clientName" title="${message(code: 'surveyInvitationRequest.clientName.label', default: 'Client Name')}"/>
      <g:sortableColumn property="clientEmail" title="${message(code: 'surveyInvitationRequest.clientName.label', default: 'Client Email')}"/>
      <th><g:message code="surveyInvitationRequest.dateCreated.label" default="Date Sent"/></th>
      <th><g:message code="surveyInvitationRequest.notification.listing.closedDate.label" default="Sold Date"/></th>

      <th><g:message code="surveyInvitationRequest.notification.surveyCompletedDate.label" default="Response Date"/></th>

    </tr>
    </thead>
    <tbody>
    <g:each in="${surveyInvitationRequestInstanceList}" status="i" var="surveyInvitationRequestInstance">
      
      <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
        <td><g:link controller="surveyInvitationRequest" action="edit" id="${surveyInvitationRequestInstance.id}">${fieldValue(bean: surveyInvitationRequestInstance, field: "notification.listing.mlsNumber")}</g:link></td>

        <td><g:link controller="surveyInvitationRequest" action="edit" id="${surveyInvitationRequestInstance.id}">${fieldValue(bean: surveyInvitationRequestInstance, field: "notification.listing.sellingAgent.lastName")},<br/>${fieldValue(bean: surveyInvitationRequestInstance, field: "notification.listing.sellingAgent.firstName")}</g:link></td>

        <td><g:link controller="surveyInvitationRequest" action="edit" id="${surveyInvitationRequestInstance.id}">${fieldValue(bean: surveyInvitationRequestInstance, field: "clientName")}</g:link></td>

        <td><g:link controller="surveyInvitationRequest" action="edit" id="${surveyInvitationRequestInstance.id}">${fieldValue(bean: surveyInvitationRequestInstance, field: "clientEmail")}</g:link></td>

        <td><g:link controller="surveyInvitationRequest" action="edit" id="${surveyInvitationRequestInstance.id}">${surveyInvitationRequestInstance.dateCreated?.format("yyyy-MM-dd")}</g:link></td>

        <td><g:link controller="surveyInvitationRequest" action="edit" id="${surveyInvitationRequestInstance.id}">${surveyInvitationRequestInstance.notification.listing.closedDate?.format("yyyy-MM-dd")}</g:link></td>

        <td><g:link controller="surveyInvitationRequest" action="edit" id="${surveyInvitationRequestInstance.id}">${surveyInvitationRequestInstance.notification.surveyCompletedDate?.format("yyyy-MM-dd")}</g:link></td>

      </tr>
    </g:each>
    </tbody>
  </table>
</div>

