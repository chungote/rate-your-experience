<%@ page import="notification.SurveyInvitationRequest" %>



<div class="body">
  <div class="list">
    <table>
      <thead>
      <tr>

        <g:sortableColumn property="id" title="${message(code: 'surveyInvitationRequest.id.label', default: 'Id')}"/>

        <th><g:message code="surveyInvitationRequest.notification.label" default="Notification"/></th>

        <g:sortableColumn property="clientName" title="${message(code: 'surveyInvitationRequest.clientName.label', default: 'Client Name')}"/>

        <g:sortableColumn property="clientEmail" title="${message(code: 'surveyInvitationRequest.clientEmail.label', default: 'Client Email')}"/>

        <th><g:message code="surveyInvitationRequest.lender.label" default="Lender"/></th>

        <th><g:message code="surveyInvitationRequest.houseInspector.label" default="House Inspector"/></th>

      </tr>
      </thead>
      <tbody>
      <g:each in="${surveyInvitationRequestInstanceList}" status="i" var="surveyInvitationRequestInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

          <td><g:link action="show" id="${surveyInvitationRequestInstance.id}">${fieldValue(bean: surveyInvitationRequestInstance, field: "id")}</g:link></td>

          <td>${fieldValue(bean: surveyInvitationRequestInstance, field: "notification")}</td>

          <td>${fieldValue(bean: surveyInvitationRequestInstance, field: "clientName")}</td>

          <td>${fieldValue(bean: surveyInvitationRequestInstance, field: "clientEmail")}</td>

          <td>${fieldValue(bean: surveyInvitationRequestInstance, field: "lender")}</td>

          <td>${fieldValue(bean: surveyInvitationRequestInstance, field: "houseInspector")}</td>

        </tr>
      </g:each>
      </tbody>
    </table>
    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></span>
  </div>
  <div class="paginateButtons">
    <g:paginate total="${surveyInvitationRequestInstanceTotal}"/>
  </div>
</div>
