<%@ page import="survey.Question" %>
<div class="">
  <g:hasErrors bean="${questionInstance}">
    <div class="errors">
      <g:renderErrors bean="${questionInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:hiddenField name="${prefix}id" value="${questionInstance?.id}"/>
  <g:hiddenField name="${prefix}version" value="${questionInstance?.version}"/>
  <div class="dialog">
    <table>
      <tbody>

      <tr class="prop">
        <td valign="top" class="name">
          <label for="${prefix}text"><g:message code="question.text.label" default="Question Text"/></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: questionInstance, field: 'text', 'errors')}">
          <g:textArea class="accordionTextArea" name="${prefix}text" value="${questionInstance?.text}"/>
        </td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">
          <label for="${prefix}header"><g:message code="question.header.label" default="Question Heading"/></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: questionInstance, field: 'header', 'errors')}">
          <g:textArea class="accordionTextArea" name="${prefix}header" value="${questionInstance?.header}"/>
        </td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">
          <label for="${prefix}help"><g:message code="question.help.label" default="Help Text"/></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: questionInstance, field: 'help', 'errors')}">
          <g:textArea class="accordionTextArea" name="${prefix}help" value="${questionInstance?.help}"/>
        </td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">
          <label for="${prefix}questionType"><g:message code="question.questionType.label" default="Answer Type"/></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: questionInstance, field: 'questionType', 'errors')}">
          <g:select name="questionType" from="${questionInstance?.constraints?.questionType?.inList}"
                  value="${questionInstance?.questionType}"
                  valueMessagePrefix="question.type"/>
        </td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">
          <label for="${prefix}textBoxSize"><g:message code="question.textBoxSize.label" default="Text Input Size"/></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: questionInstance, field: 'textBoxSize', 'errors')}">
          <g:textField name="${prefix}textBoxSize" value="${fieldValue(bean: questionInstance, field: 'textBoxSize')}"/>
        </td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">
          <label for="${prefix}textFieldSize"><g:message code="question.textFieldSize.label" default="Text Field Size"/></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: questionInstance, field: 'textFieldSize', 'errors')}">
          <g:textField name="${prefix}textFieldSize" value="${fieldValue(bean: questionInstance, field: 'textFieldSize')}"/>
        </td>
      </tr>
      <tr class="prop">
        <td valign="top" class="name">
          <label for="${prefix}rateable"><g:message code="question.rateable.label" default="Rateable"/></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: questionInstance, field: 'rateable', 'errors')}">
          <g:checkBox name="${prefix}rateable" value="${questionInstance?.rateable}"/>
        </td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">
          <label for="${prefix}required"><g:message code="question.required.label" default="Required"/></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: questionInstance, field: 'required', 'errors')}">
          <g:checkBox name="${prefix}required" value="${questionInstance?.required}"/>
        </td>
      </tr>
      <g:if test="${['SINGLE_CHOICE','MULTIPLE_CHOICE'].contains(questionInstance?.questionType)}">
        <tr class="prop">
          <td valign="top" class="name">
            <label for="${prefix}answers"><g:message code="question.answers.label" default="Answers"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: questionInstance, field: 'answers', 'errors')}">
            <richui:accordion>
              <g:each status="i" in="${questionInstance?.answers?.sort{it.sortOrder}}" var="a">
                <richui:accordionItem id="${a.id}" caption="${a}">

                  <g:render template="/answer/edit" model="['answerInstance':a,'prefix':prefix+'answers['+i+'].']"/>

                </richui:accordionItem>
              </g:each>

              <div id="${prefix}newQuestionHolder"></div>

            </richui:accordion>

            <div id="${prefix}" class='addQuestion faux-button'>
              <g:remoteLink
                      controller="answer"
                      action="addAnswer"
                      params="[prefix:prefix+'answers[--size--].', size:'--size--']"
                      update="[success:prefix+'answers[--size--]', failure:prefix+'newQuestionHolder']"
                      before="questions.addQuestion('${prefix}','${prefix+'answers[--size--]'}', '${prefix}newQuestionHolder')">
                Add a New Answer
              </g:remoteLink>
              <script type="text/javascript">sizes["${prefix}"] = '${((questionInstance?.answers?.size())?:0)}'; </script>
            </div>
          </td>
        </tr>
      </g:if>

      </tbody>
    </table>
  </div>

  <g:hiddenField name="${prefix}sortOrder" value="${questionInstance?.sortOrder}"/>
</div>
