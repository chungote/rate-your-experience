<%@ page import="notification.SurveyInvitationRequest" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'surveyInvitationRequest.label', default: 'SurveyInvitationRequest')}"/>
  <title><g:message code="default.edit.label" args="[entityName]"/></title>
  <resource:autoComplete skin="default"/>

</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
  <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></span>
  <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></span>
</div>
<div class="body">
  <h1>Prepare A Survey Invitation Request</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${surveyInvitationRequestInstance}">
    <div class="errors">
      <g:renderErrors bean="${surveyInvitationRequestInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form method="post" action="update">
    <g:hiddenField name="id" value="${surveyInvitationRequestInstance?.id}"/>
    <g:hiddenField name="version" value="${surveyInvitationRequestInstance?.version}"/>
    <g:hiddenField name="survey.id" value="${surveyInvitationRequestInstance?.survey?.id}"/>
    <div class="dialog">
      <table>
        <tbody><tr class="prop">
                <td valign="top" class="name">
                  <label for="name"><g:message code="survey.name.label" default="Name"/></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'name', 'errors')}">
                  <g:textField name="name" value="${surveyInvitationRequestInstance?.survey?.name?.decodeHTML()}"/>
                </td>
              </tr>

   
        <tr class="prop">
          <td valign="top" class="name">
            <label for="notification"><g:message code="surveyInvitationRequest.notification.label" default="Notification for MLS"/></label>
          </td>
          <td valign="top" class="value">
            <g:link controller="notification" action="show" id="${surveyInvitationRequestInstance?.notification?.id}">${surveyInvitationRequestInstance?.notification?.listing?.mlsNumber?.encodeAsHTML()}</g:link>
          </td>
        </tr>

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
            <label for="lender"><g:message code="surveyInvitationRequest.lender.label" default="Lender"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: surveyInvitationRequestInstance, field: 'lender', 'errors')}">
	   		<g:hiddenField name="lender.id" value="${surveyInvitationRequestInstance?.lender?.id}"/>
	   
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
            <label for="houseInspector"><g:message code="surveyInvitationRequest.houseInspector.label" default="House Inspector"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: surveyInvitationRequestInstance, field: 'houseInspector', 'errors')}">
            <g:hiddenField name="houseInspector.id" value="${surveyInvitationRequestInstance?.houseInspector?.id}"/>
	    	   
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
            <label for="radonInspector"><g:message code="surveyInvitationRequest.radonInspector.label" default="Radon Inspector"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: surveyInvitationRequestInstance, field: 'radonInspector', 'errors')}">
            <g:hiddenField name="radonInspector.id" value="${surveyInvitationRequestInstance?.radonInspector?.id}"/>
	    	   
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
            <label for="termiteInspector"><g:message code="surveyInvitationRequest.termiteInspector.label" default="Termite Inspector"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: surveyInvitationRequestInstance, field: 'termiteInspector', 'errors')}">
            <g:hiddenField name="termiteInspector.id" value="${surveyInvitationRequestInstance?.termiteInspector?.id}"/>
	    	   
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
            <label for="moldInspector"><g:message code="surveyInvitationRequest.moldInspector.label" default="Mold Inspector"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: surveyInvitationRequestInstance, field: 'moldInspector', 'errors')}">
            <g:hiddenField name="moldInspector.id" value="${surveyInvitationRequestInstance?.moldInspector?.id}"/>
	    	   
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
      <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>
      <span class="button"><b>
      <g:link action="updateAndSend" params="[id:surveyInvitationRequestInstance?.id, notificationId:surveyInvitationRequestInstance.notification.id]">
                         Send Survey Request to Client
      </g:link>
      </b>
      </span>
     </div>
  </g:form>
</div>
</body>
</html>
