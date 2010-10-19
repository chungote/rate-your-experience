<%@ page import="survey.QuestionGroup" %>
<%@ page import="survey.Question" %>

<div class="">

  <g:hasErrors bean="${questionGroupInstance}">
    <div class="errors">
      <g:renderErrors bean="${questionGroupInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:hiddenField name="${prefix}id" value="${questionGroupInstance?.id}"/>
  <g:hiddenField name="${prefix}version" value="${questionGroupInstance?.version}"/>
  <div class="dialog">
    <table>
      <tbody>

      <tr class="prop">
        <td valign="top" class="name">
          <label for="${prefix}name"><g:message code="questionGroup.name.label" default="Section Name"/></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: questionGroupInstance, field: 'name', 'errors')}">
          <g:textField name="${prefix}name" value="${questionGroupInstance?.name}"/>
        </td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">
          <label for="${prefix}description"><g:message code="questionGroup.description.label" default="Section Description"/></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: questionGroupInstance, field: 'description', 'errors')}">
          <g:textField name="${prefix}description" value="${questionGroupInstance?.description}"/>
        </td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">
          <label for="${prefix}questions"><g:message code="questionGroup.questions.label" default="Questions"/></label>
        </td>
        <td valign="top" class="accordionFont ${hasErrors(bean: questionGroupInstance, field: 'questions', 'errors')}">

          <richui:accordion>
            <g:each status="i" in="${questionGroupInstance?.questions?.sort{it.sortOrder}}" var="q">
              <richui:accordionItem id="${q.id}" caption="${q}">

                <g:render template="/question/edit"
                        model="['questionInstance':q,'prefix':prefix+'questions['+i+'].']"/>

              </richui:accordionItem>
            </g:each>

            <div id="${prefix}newQuestionHolder"></div>

          </richui:accordion>

          <div id="${prefix}" class='addQuestion faux-button'>
            <g:remoteLink
                    controller="question"
                    action="addQuestion"
                    params="[prefix:prefix+'questions[--size--].', size:'--size--']"
                    update="[success:prefix+'questions[--size--]', failure:prefix+'newQuestionHolder']"
                    before="questions.addQuestion('${prefix}','${prefix+'questions[--size--]'}', '${prefix}newQuestionHolder')">
              Add a New Question
            </g:remoteLink>
            <script type="text/javascript">sizes["${prefix}"] = '${((questionGroupInstance?.questions?.size())?:0)}'; </script>
          </div>
        </td>
      </tr>

      </tbody>
    </table>
  </div>


  <g:hiddenField name="${prefix}sortOrder" value="${questionGroupInstance?.sortOrder?:0}"/>
  <g:hiddenField name="${prefix}type" value="${(questionGroupInstance?.type)?:type}"/>

</div>
