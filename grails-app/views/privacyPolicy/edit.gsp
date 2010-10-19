<%@ page import="system.PrivacyPolicy" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'privacyPolicy.label', default: 'PrivacyPolicy')}"/>
  <title><g:message code="default.edit.label" args="[entityName]"/></title>
  <resource:richTextEditor/>

</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
  <span class="menuButton"><g:link class="list" action="list">Back to list</g:link></span>
  <span class="menuButton"><g:link class="create" action="create">Create a new Privacy Policy</g:link></span>
</div>
<div class="body">
  <h1>Edit Privacy Policy</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${privacyPolicyInstance}">
    <div class="errors">
      <g:renderErrors bean="${privacyPolicyInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form method="post">
    <g:hiddenField name="id" value="${privacyPolicyInstance?.id}"/>
    <g:hiddenField name="version" value="${privacyPolicyInstance?.version}"/>
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="content"><g:message code="privacyPolicy.content.label" default="Content"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: privacyPolicyInstance, field: 'content', 'errors')}">
            <richui:richTextEditor name="content" value="${privacyPolicyInstance?.content}" width="525"/>
            <%--
            <g:textArea name="content" cols="80" rows="5" value="${privacyPolicyInstance?.content}" />
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
