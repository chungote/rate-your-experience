<%@ page import="system.Config" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'config.label', default: 'System-Wide Options')}"/>
  <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
</div>
<div class="body">
  <h1>System-Wide Options</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${configInstance}">
    <div class="errors">
      <g:renderErrors bean="${configInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form method="post">
    <g:hiddenField name="id" value="${configInstance?.id}"/>
    <g:hiddenField name="version" value="${configInstance?.version}"/>
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="moderation"><g:message code="config.moderation.label" default="Moderation"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: configInstance, field: 'moderation', 'errors')}">
            <g:checkBox name="moderation" value="${configInstance?.moderation}"/>
          </td>
        </tr>

  <tr class="prop">
          <td valign="top" class="name">
            <label for="moderation"><g:message code="config.moderation.label" default="Send Email When a Survey is Flagged For Review"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: configInstance, field: 'emailFlaggedReview', 'errors')}">
            <g:checkBox name="moderation" value="${configInstance?.emailFlaggedReview}"/>
          </td>
        </tr>


        <tr class="prop">
          <td valign="top" class="name">
            <label for="systemOpting"><g:message code="config.systemOpting.label" default="System-Wide Opting"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: configInstance, field: 'systemOpting', 'errors')}">
            <g:select name="systemOpting" from="${configInstance.constraints.systemOpting.inList}" value="${configInstance?.systemOpting}" valueMessagePrefix="config.systemOpting"/>
          </td>
        </tr>

        </tbody>
      </table>
    </div>
    <div class="buttons">
    <g:ifAnyGranted role="ROLE_ADMIN">
      <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>
      </div>
    </g:ifAnyGranted>
  </g:form>
</div>
</body>
</html>
