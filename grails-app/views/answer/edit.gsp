<%@ page import="survey.Answer" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'answer.label', default: 'Answer')}"/>
  <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
  <span class="menuButton"><g:link action="create" params="['question.id': answerInstance?.question?.id]"><g:message code="default.new.label" args="[entityName]"/></g:link></span>
  <g:link controller="survey" action="show" id="${answerInstance?.question?.group?.survey.id}">Back to Survey</g:link>
</div>
<div class="body">
  <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${answerInstance}">
    <div class="errors">
      <g:renderErrors bean="${answerInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form method="post">
    <g:hiddenField name="id" value="${answerInstance?.id}"/>
    <g:hiddenField name="version" value="${answerInstance?.version}"/>
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="question"><g:message code="answer.question.label" default="Question"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: answerInstance, field: 'question', 'errors')}">
            <g:link controller="question" action="show" id="${answerInstance?.question?.id}">${answerInstance?.question?.encodeAsHTML()}</g:link>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="sortOrder"><g:message code="answer.sortOrder.label" default="Sort Order"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: answerInstance, field: 'sortOrder', 'errors')}">
            <g:textField name="sortOrder" value="${fieldValue(bean: answerInstance, field: 'sortOrder')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="text"><g:message code="answer.text.label" default="Text"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: answerInstance, field: 'text', 'errors')}">
            <g:textField name="text" value="${answerInstance?.text}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="defaultAnswer"><g:message code="answer.defaultAnswer.label" default="Default Answer"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: answerInstance, field: 'defaultAnswer', 'errors')}">
            <g:checkBox name="defaultAnswer" value="${answerInstance?.defaultAnswer}"/>
          </td>
        </tr>

        </tbody>
      </table>
    </div>
    <div class="buttons">
      <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>

    </div>
    <g:hiddenField name="question.id" value="${answerInstance?.question?.id}"/>
  </g:form>
</div>
</body>
</html>
