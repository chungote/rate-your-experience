<%@ page import="system.TermsOfService" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'termsOfService.label', default: 'TermsOfService')}"/>
  <title><g:message code="default.edit.label" args="[entityName]"/></title>
  <resource:richTextEditor/>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
  <span class="menuButton"><g:link class="list" action="list">Back to list</g:link></span>
  <span class="menuButton"><g:link class="create" action="create">Create a new Terms of Service</g:link></span>
</div>
<div class="body">
  <h1>Edit Terms of Service</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${termsOfServiceInstance}">
    <div class="errors">
      <g:renderErrors bean="${termsOfServiceInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form method="post">
    <g:hiddenField name="id" value="${termsOfServiceInstance?.id}"/>
    <g:hiddenField name="version" value="${termsOfServiceInstance?.version}"/>
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="type"><g:message code="termsOfService.type.label" default="Type"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: termsOfServiceInstance, field: 'type', 'errors')}">
            <g:select name="type" from="${termsOfServiceInstance.constraints.type.inList}" value="${termsOfServiceInstance?.type}" valueMessagePrefix="termsOfService.type"/>
          </td>
        </tr>


        <tr class="prop">
          <td valign="top" class="name">
            <label for="description"><g:message code="termsOfService.description.label" default="Description"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: termsOfServiceInstance, field: 'description', 'errors')}">
            <g:textField name="description" maxlength="100" size="100" value="${termsOfServiceInstance?.description}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="content"><g:message code="termsOfService.content.label" default="Content"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: termsOfServiceInstance, field: 'content', 'errors')}">
            <richui:richTextEditor name="content" value="${termsOfServiceInstance?.content}" width="525"/>
            <%--
            <g:textArea name="content" cols="80" rows="5" value="${termsOfServiceInstance?.content}" />
            --%>
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
