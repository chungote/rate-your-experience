<%@ page import="system.PrivacyPolicy" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'privacyPolicy.label', default: 'PrivacyPolicy')}"/>
  <title><g:message code="default.create.label" args="[entityName]"/></title>
  <resource:richTextEditor/>

</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
  <span class="menuButton"><g:link class="list" action="list">Back to list</g:link></span>
</div>
<div class="body">
  <h1>Create Privacy Policy</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${privacyPolicyInstance}">
    <div class="errors">
      <g:renderErrors bean="${privacyPolicyInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form action="save" method="post">
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
      <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}"/></span>
    </div>
  </g:form>
</div>
</body>
</html>
