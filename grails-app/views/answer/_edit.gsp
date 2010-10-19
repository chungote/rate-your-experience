<%@ page import="survey.Answer" %>
<div class="">
  <g:hasErrors bean="${answerInstance}">
    <div class="errors">
      <g:renderErrors bean="${answerInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:hiddenField name="${prefix}id" value="${answerInstance?.id}"/>
  <g:hiddenField name="${prefix}version" value="${answerInstance?.version}"/>
  <div class="dialog">
    <table>
      <tbody>

      <tr class="prop">
        <td valign="top" class="name">
          <label for="${prefix}text"><g:message code="answer.text.label" default="Text"/></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: answerInstance, field: 'text', 'errors')}">
          <g:textArea class="accordionTextArea" name="${prefix}text" value="${answerInstance?.text}"/>
        </td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">
          <label for="${prefix}defaultAnswer"><g:message code="answer.defaultAnswer.label" default="Default Answer"/></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: answerInstance, field: 'defaultAnswer', 'errors')}">
          <g:checkBox name="${prefix}defaultAnswer" value="${answerInstance?.defaultAnswer}"/>
        </td>
      </tr>

      </tbody>
    </table>

    <g:hiddenField name="${prefix}sortOrder" value="${answerInstance?.sortOrder}"/>

  </div>

</div>