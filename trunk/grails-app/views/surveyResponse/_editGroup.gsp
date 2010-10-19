<g:each in="${group.questions.sort{it.sortOrder}}" status="j" var="question">

  <div class="question ${(j % 2) == 0 ? 'odd' : 'even'}">
    <g:if test="${question.header}">
      <div class="questionHeader"><g:fieldValue bean="${question}" field="header"/></div>
    </g:if>
    <div class="questionText">
      ${question.text}
    </div>

    <g:if test="${question.rateable}">

      <div id="star_div_${question.id}">
        <richui:rating dynamic="true" inputId="rating_${question.id}" inputName="rating_${question.id}" noAjax="true" units="5"/>
      </div>
    </g:if>

    <div class=answer>
      <%
        switch (question.questionType) {
          case "SINGLE_CHOICE":
      %>
      <g:each in="${question.answers.sort{it.sortOrder}}" status="k" var="answer">
        <g:radio class="radio" name="question_${question.id}" value="${answer.text}" checked="${answer.defaultAnswer}"/>
        ${answer.text}
        <br/>
      </g:each>
      <%
          break
          case "MULTI_CHOICE":
      %>
      <g:each in="${question.answers.sort{it.sortOrder}}" status="k" var="answer">
        <g:checkBox class="checkbox" name="question_${question.id}" value="${answer.text}" checked="${answer.defaultAnswer}"/>
        ${answer.text}
        <br/>

      </g:each>
      <%
          break
          case "TEXTBOX":
      %>
      <g:textArea name="question_${question.id}" value="" rows="5" cols="${ question.textBoxSize }"/>
      <%
          break
          case "TEXTFIELD":
          default:
      %>
      <g:textField name="question_${question.id}" value="" size="${ question.textFieldSize }"/>
      <%
          break

        }

      %>
    </div>
  </div>
</g:each>

