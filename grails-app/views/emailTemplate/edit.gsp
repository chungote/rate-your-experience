<%@ page import="notification.EmailTemplate" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'emailTemplate.label', default: 'EmailTemplate')}"/>
  <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
  <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></span>
</div>
<div class="body">
  <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${emailTemplateInstance}">
    <div class="errors">
      <g:renderErrors bean="${emailTemplateInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form method="post">
    <g:hiddenField name="id" value="${emailTemplateInstance?.id}"/>
    <g:hiddenField name="version" value="${emailTemplateInstance?.version}"/>
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="name"><g:message code="emailTemplate.name.label" default="Name"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: emailTemplateInstance, field: 'name', 'errors')}">
            <g:textField name="name" maxlength="250" size="100" value="${emailTemplateInstance?.name}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="requestForInformationSubject"><g:message code="emailTemplate.requestForInformationSubject.label" default="Request For Information Subject"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: emailTemplateInstance, field: 'requestForInformationSubject', 'errors')}">
            <g:textField name="requestForInformationSubject" maxlength="250" size="100" value="${emailTemplateInstance?.requestForInformationSubject}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="requestForInformationBody"><g:message code="emailTemplate.requestForInformationBody.label" default="Request For Information Body"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: emailTemplateInstance, field: 'requestForInformationBody', 'errors')}">
            <g:textArea name="requestForInformationBody" cols="80" rows="5" value="${emailTemplateInstance?.requestForInformationBody}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="secondRequestForInformationSubject"><g:message code="emailTemplate.secondRequestForInformationSubject.label" default="Second Request For Information Subject"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: emailTemplateInstance, field: 'secondRequestForInformationSubject', 'errors')}">
            <g:textField name="secondRequestForInformationSubject" maxlength="250" size="100" value="${emailTemplateInstance?.secondRequestForInformationSubject}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="secondRequestForInformationBody"><g:message code="emailTemplate.secondRequestForInformationBody.label" default="Second Request For Information Body"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: emailTemplateInstance, field: 'secondRequestForInformationBody', 'errors')}">
            <g:textArea name="secondRequestForInformationBody" cols="80" rows="5" value="${emailTemplateInstance?.secondRequestForInformationBody}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="surveyInvitationRequestSubject"><g:message code="emailTemplate.surveyInvitationRequestSubject.label" default="Survey Invitation Request Subject"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: emailTemplateInstance, field: 'surveyInvitationRequestSubject', 'errors')}">
            <g:textField name="surveyInvitationRequestSubject" maxlength="250" size="100" value="${emailTemplateInstance?.surveyInvitationRequestSubject}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="surveyInvitationRequestBody"><g:message code="emailTemplate.surveyInvitationRequestBody.label" default="Survey Invitation Request Body"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: emailTemplateInstance, field: 'surveyInvitationRequestBody', 'errors')}">
            <g:textArea name="surveyInvitationRequestBody" cols="80" rows="5" value="${emailTemplateInstance?.surveyInvitationRequestBody}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="surveyCompletionNotificationSubject"><g:message code="emailTemplate.surveyCompletionNotificationSubject.label" default="Survey Completion Notification Subject"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: emailTemplateInstance, field: 'surveyCompletionNotificationSubject', 'errors')}">
            <g:textField name="surveyCompletionNotificationSubject" maxlength="250" size="100" value="${emailTemplateInstance?.surveyCompletionNotificationSubject}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="surveyCompletionNotificationBody"><g:message code="emailTemplate.surveyCompletionNotificationBody.label" default="Survey Completion Notification Body"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: emailTemplateInstance, field: 'surveyCompletionNotificationBody', 'errors')}">
            <g:textArea name="surveyCompletionNotificationBody" cols="80" rows="5" value="${emailTemplateInstance?.surveyCompletionNotificationBody}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="surveyApprovalRequestSubject"><g:message code="emailTemplate.surveyApprovalRequestSubject.label" default="Survey Approval Request Subject"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: emailTemplateInstance, field: 'surveyApprovalRequestSubject', 'errors')}">
            <g:textField name="surveyApprovalRequestSubject" maxlength="250" size="100" value="${emailTemplateInstance?.surveyApprovalRequestSubject}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="surveyApprovalRequestBody"><g:message code="emailTemplate.surveyApprovalRequestBody.label" default="Survey Approval Request Body"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: emailTemplateInstance, field: 'surveyApprovalRequestBody', 'errors')}">
            <g:textArea name="surveyApprovalRequestBody" cols="80" rows="5" value="${emailTemplateInstance?.surveyApprovalRequestBody}"/>
          </td>
        </tr>

        </tbody>
      </table>
    </div>
    <div class="buttons">
      <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>
    </div>
  </g:form>
</div>
</body>
</html>
