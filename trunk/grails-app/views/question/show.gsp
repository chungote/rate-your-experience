<%@ page import="survey.Question" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}"/>
  <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
  <span class="menuButton"><g:link controller="question" action="create" params="['group.id': questionInstance?.group?.id]"><g:message code="default.new.label" args="[entityName]"/></g:link></span>
  <g:link controller="survey" action="show" id="${questionInstance?.group?.survey.id}">Back to Survey</g:link>
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
        <td valign="top" class="name"><g:message code="question.id.label" default="Id"/></td>

        <td valign="top" class="value">${fieldValue(bean: questionInstance, field: "id")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="question.group.label" default="Group"/></td>

        <td valign="top" class="value"><g:link controller="questionGroup" action="show" id="${questionInstance?.group?.id}">${questionInstance?.group?.encodeAsHTML()}</g:link></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="question.sortOrder.label" default="Sort Order"/></td>

        <td valign="top" class="value">${fieldValue(bean: questionInstance, field: "sortOrder")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="question.text.label" default="Question Text"/></td>

        <td valign="top" class="value">${fieldValue(bean: questionInstance, field: "text")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="question.header.label" default="Question Heading"/></td>

        <td valign="top" class="value">${fieldValue(bean: questionInstance, field: "header")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="question.help.label" default="Help Text"/></td>

        <td valign="top" class="value">${fieldValue(bean: questionInstance, field: "help")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="question.questionType.label" default="Question Type"/></td>

        <td valign="top" class="value">${fieldValue(bean: questionInstance, field: "questionType")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="question.textBoxSize.label" default="Text Box Size"/></td>

        <td valign="top" class="value">${fieldValue(bean: questionInstance, field: "textBoxSize")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="question.textFieldSize.label" default="Text Field Size"/></td>

        <td valign="top" class="value">${fieldValue(bean: questionInstance, field: "textFieldSize")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="question.answers.label" default="Answers"/></td>

        <td valign="top" style="text-align: left;" class="value">
          <ul>
            <g:each in="${questionInstance.answers}" var="a">
              <li><g:link controller="answer" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
            </g:each>
          </ul>
        </td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="question.rateable.label" default="Rateable"/></td>

        <td valign="top" class="value"><g:formatBoolean boolean="${questionInstance?.rateable}"/></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="question.required.label" default="Required"/></td>

        <td valign="top" class="value"><g:formatBoolean boolean="${questionInstance?.required}"/></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="question.dateCreated.label" default="Date Created"/></td>

        <td valign="top" class="value">${questionInstance?.dateCreated?.format("yyyy-MM-dd")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="question.lastUpdated.label" default="Last Updated"/></td>

        <td valign="top" class="value"><g:formatDate date="${questionInstance?.lastUpdated}"/></td>

      </tr>

      </tbody>
    </table>
  </div>
  <p>To add or edit Answers for this Question, click the "Edit" button. If your question is a "TEXTFIELD" or "TEXTBOX" type,
  you do not need to add Answers.  Answers are only necessary for "CHOICE" question types.</p>
  <div class="buttons">
    <g:form>
      <g:hiddenField name="id" value="${questionInstance?.id}"/>
      <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>

    </g:form>
  </div>
</div>
</body>
</html>
