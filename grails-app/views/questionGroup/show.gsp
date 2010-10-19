<%@ page import="survey.QuestionGroup" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'questionGroup.label', default: 'QuestionGroup')}"/>
  <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
  <span class="menuButton"><g:link action="create" params="['survey.id': questionGroupInstance?.survey?.id]"><g:message code="default.new.label" args="[entityName]"/></g:link></span>
  <g:link controller="survey" action="show" id="${questionGroupInstance?.survey.id}">Back to Survey</g:link>
</div>
<div class="body">
  <h1><g:message code="default.show.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="dialog">
    <table>
      <tbody>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="questionGroup.id.label" default="Id"/></td>

        <td valign="top" class="value">${fieldValue(bean: questionGroupInstance, field: "id")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="questionGroup.survey.label" default="Survey"/></td>

        <td valign="top" class="value"><g:link controller="survey" action="show" id="${questionGroupInstance?.survey?.id}">${questionGroupInstance?.survey?.encodeAsHTML()}</g:link></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="questionGroup.sortOrder.label" default="Sort Order"/></td>

        <td valign="top" class="value">${fieldValue(bean: questionGroupInstance, field: "sortOrder")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="questionGroup.name.label" default="Name"/></td>

        <td valign="top" class="value">${fieldValue(bean: questionGroupInstance, field: "name")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="questionGroup.description.label" default="Description"/></td>

        <td valign="top" class="value">${fieldValue(bean: questionGroupInstance, field: "description")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="questionGroup.questions.label" default="Questions"/></td>

        <td valign="top" style="text-align: left;" class="value">
          <ul>
            <g:each in="${questionGroupInstance.questions}" var="q">
              <li><g:link controller="question" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></li>
            </g:each>
          </ul>
        </td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="questionGroup.dateCreated.label" default="Date Created"/></td>

        <td valign="top" class="value">${questionGroupInstance?.dateCreated?.format("yyyy-MM-dd")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="questionGroup.lastUpdated.label" default="Last Updated"/></td>

        <td valign="top" class="value"><g:formatDate date="${questionGroupInstance?.lastUpdated}"/></td>

      </tr>

      </tbody>
    </table>
    <p>To add or edit Questions for this Group, click the "Edit" button.</p>
  </div>
  <div class="buttons">
    <g:form>
      <g:hiddenField name="id" value="${questionGroupInstance?.id}"/>
      <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>

    </g:form>
  </div>
</div>
</body>
</html>
