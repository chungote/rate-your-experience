<%@ page import="notification.SurveyInvitationRequest" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'surveyInvitationRequest.label', default: 'SurveyInvitationRequest')}"/>
  <title><g:message code="default.create.label" args="[entityName]"/></title>
  <resource:autoComplete skin="default"/>

</head>
<body>
<% /*
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
*/ %>
<div class="body">
  <% /*
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
       */ %>
  <h2>Experience Survey Request</h2>
  <div class="welcome">
    ${surveyInvitationRequestInstance?.notification?.listing?.sellingAgent?.firstName} ${surveyInvitationRequestInstance?.notification?.listing?.sellingAgent?.lastName}, ${surveyInvitationRequestInstance?.notification?.sellingOffice?.officeName} Selling Agent<br/>
    ${surveyInvitationRequestInstance?.notification?.listing?.streetAddress}, ${surveyInvitationRequestInstance?.notification?.listing?.city} <br/>
    Closing Date: ${surveyInvitationRequestInstance?.notification?.listing?.closedDate?.format("yyyy-MM-dd")} <br/>
  </div>
  <div class="welcome">
    You have received this notice because you are a participant of "Rate Your Experience"! Please provide the following information, where applicable, to prepare your client's survey.
    You will be notified when your client has completed the survey.
  </div>

  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${surveyInvitationRequestInstance.notification}">
    <div class="errors">
      <g:renderErrors bean="${surveyInvitationRequestInstance.notification}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form action="save" method="post">
    <g:hiddenField name="notification.id" value="${surveyInvitationRequestInstance?.notification?.id}"/>
    <g:hiddenField name="notificationId" value="${surveyInvitationRequestInstance?.notification?.id}"/>
    <g:hiddenField name="survey.id" value="1"/>
    <div class="dialog">
      <table>
        <tbody>
        <tr class="prop">
          <td valign="top" class="name">
            <label for="clientName"><g:message code="surveyInvitationRequest.clientName.label" default="Client Name"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: surveyInvitationRequestInstance, field: 'clientName', 'errors')}">
            <g:textField name="clientName" maxlength="120" size="100" value="${surveyInvitationRequestInstance?.clientName}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="clientEmail"><g:message code="surveyInvitationRequest.clientEmail.label" default="Client Email"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: surveyInvitationRequestInstance, field: 'clientEmail', 'errors')}">
            <g:textField name="clientEmail" maxlength="200" size="100" value="${surveyInvitationRequestInstance?.clientEmail}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="lender.lookupName"><g:message code="surveyInvitationRequest.lender.label" default="Lender"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: surveyInvitationRequestInstance, field: 'lender', 'errors')}">
            <g:hiddenField name="lender.id" value=""/>

            <richui:autoComplete name="lender.lookupName"
                    minQueryLength="1"
                    queryDelay="1"
                    delimChar=""
                    action="searchAJAXLenderProviders"
                    forceSelection="true"
                    value="${surveyInvitationRequestInstance?.lender?.lookupName}"
                    onItemSelect="\$('lender.id').value = id"/>

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="houseInspector.lookupName"><g:message code="surveyInvitationRequest.houseInspector.label" default="House Inspector"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: surveyInvitationRequestInstance, field: 'houseInspector', 'errors')}">
            <g:hiddenField name="houseInspector.id" value=""/>

            <richui:autoComplete name="houseInspector.lookupName"
                    minQueryLength="1"
                    queryDelay="1"
                    delimChar=""
                    action="searchAJAXHouseInspectorProviders"
                    forceSelection="true"
                    value="${surveyInvitationRequestInstance?.houseInspector?.lookupName}"
                    onItemSelect="\$('houseInspector.id').value = id"/>

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="radonInspector.lookupName"><g:message code="surveyInvitationRequest.radonInspector.label" default="Radon Inspector"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: surveyInvitationRequestInstance, field: 'radonInspector', 'errors')}">
            <g:hiddenField name="radonInspector.id" value=""/>

            <richui:autoComplete name="radonInspector.lookupName"
                    minQueryLength="1"
                    queryDelay="1"
                    delimChar=""
                    action="searchAJAXRadonInspectorProviders"
                    forceSelection="true"
                    value="${surveyInvitationRequestInstance?.radonInspector?.lookupName}"
                    onItemSelect="\$('radonInspector.id').value = id"/>

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="termiteInspector.lookupName"><g:message code="surveyInvitationRequest.termiteInspector.label" default="Termite Inspector"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: surveyInvitationRequestInstance, field: 'termiteInspector', 'errors')}">
            <g:hiddenField name="termiteInspector.id" value=""/>

            <richui:autoComplete name="termiteInspector.lookupName"
                    minQueryLength="1"
                    queryDelay="1"
                    delimChar=""
                    action="searchAJAXTermiteInspectorProviders"
                    forceSelection="true"
                    value="${surveyInvitationRequestInstance?.termiteInspector?.lookupName}"
                    onItemSelect="\$('termiteInspector.id').value = id"/>

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="moldInspector.lookupName"><g:message code="surveyInvitationRequest.moldInspector.label" default="Mold Inspector"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: surveyInvitationRequestInstance, field: 'moldInspector', 'errors')}">
            <g:hiddenField name="moldInspector.id" value=""/>

            <richui:autoComplete name="moldInspector.lookupName"
                    minQueryLength="1"
                    queryDelay="1"
                    delimChar=""
                    action="searchAJAXMoldInspectorProviders"
                    forceSelection="true"
                    value="${surveyInvitationRequestInstance?.moldInspector?.lookupName}"
                    onItemSelect="\$('moldInspector.id').value = id"/>

          </td>
        </tr>

        </tbody>
      </table>
    </div>
    <div class="buttons">
      <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}"/></span>
    </div>
  </g:form>
</div>
</body>
</html>
