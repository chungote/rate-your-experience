<%@ page import="survey.Answer" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'answer.label', default: 'Answer')}"/>
  <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
  <span class="menuButton"><g:link action="create" params="['question.id': answerInstance?.question?.id]"><g:message code="default.new.label" args="[entityName]"/></g:link></span>
  <g:link controller="survey" action="show" id="${answerInstance?.question?.group?.survey.id}">Back to Survey</g:link>
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
        <td valign="top" class="name"><g:message code="answer.id.label" default="Id"/></td>

        <td valign="top" class="value">${fieldValue(bean: answerInstance, field: "id")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="answer.question.label" default="Question"/></td>

        <td valign="top" class="value"><g:link controller="question" action="show" id="${answerInstance?.question?.id}">${answerInstance?.question?.encodeAsHTML()}</g:link></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="answer.sortOrder.label" default="Sort Order"/></td>

        <td valign="top" class="value">${fieldValue(bean: answerInstance, field: "sortOrder")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="answer.text.label" default="Text"/></td>

        <td valign="top" class="value">${fieldValue(bean: answerInstance, field: "text")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="answer.defaultAnswer.label" default="Default Answer"/></td>

        <td valign="top" class="value"><g:formatBoolean boolean="${answerInstance?.defaultAnswer}"/></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="answer.dateCreated.label" default="Date Created"/></td>

        <td valign="top" class="value">${answerInstance?.dateCreated?.format("yyyy-MM-dd")}/></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="answer.lastUpdated.label" default="Last Updated"/></td>

        <td valign="top" class="value"><g:formatDate date="${answerInstance?.lastUpdated}"/></td>

      </tr>

      </tbody>
    </table>
  </div>
  <div class="buttons">
    <g:form>
      <g:hiddenField name="id" value="${answerInstance?.id}"/>
      <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>
    </g:form>
  </div>
</div>
</body>
</html>
