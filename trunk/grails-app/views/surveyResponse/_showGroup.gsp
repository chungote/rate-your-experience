<g:each in="${group?.questions?.sort{it?.sortOrder}}" status="j" var="question">
  <g:set var="surveyResponse" value="${responses.find{it.question == question}}"/>
  <div class="question ${(j % 2) == 0 ? 'odd' : 'even'}">
    <g:if test="${question?.header}">
      <div class="questionHeader"><g:fieldValue bean="${question}" field="header"/></div>
    </g:if>
    <div class="questionText">
      <g:fieldValue bean="${question}" field="text"/>
    </div>
    <g:if test="${question?.rateable}">

      <g:if test="${surveyResponse?.isHidden()}">
        <g:ifAllGranted role="ROLE_ADMIN">
          <div id="star_div_${question.id}">
            <richui:rating dynamic="false" rating="${surveyResponse?.rating}" units="5"/>
          </div>
        </g:ifAllGranted>
      </g:if>

      <g:if test="${!surveyResponse?.isHidden()}">
        <div id="star_div_${question.id}">
          <richui:rating dynamic="false" rating="${surveyResponse?.rating}" units="5"/>
        </div>
      </g:if>
    </g:if>
    <g:if test="${surveyResponse?.isHidden()}">
      <g:ifAllGranted role="ROLE_ADMIN">
        <div class=answer>
          <%
            switch (question?.questionType) {
              case "SINGLE_CHOICE":
          %>
          <g:each in="${question?.answers?.sort{it?.sortOrder}}" status="k" var="answer">
            <g:radio class="radio" name="question_${question.id}" value="${answer.text}" checked="${surveyResponse?.text}"/>
            <g:fieldValue bean="${answer}" field="text"/>
            <br/>
          </g:each>
          <%
              break
              case "MULTI_CHOICE":
          %>
          <g:each in="${question?.answers?.sort{it?.sortOrder}}" status="k" var="answer">
            <g:checkBox class="checkbox" name="question_${question.id}" value="${answer.text}" checked="${surveyResponse?.text}"/>
            <g:fieldValue bean="${answer}" field="text"/>
            <br/>
          </g:each>
          <%
              break
              case "TEXTBOX":
              case "TEXTFIELD":
              default:
          %>
          <g:fieldValue bean="${surveyResponse}" field="text"/>
          <%
              break
            }
          %>
          <div>
            <modalbox:createLink controller="reviewerCommentFlag" action="list" id="${surveyResponse?.id}" title="Flagged Comment List" width="500">

              <i><u>Flagged Comments and Admin Response</u></i>

            </modalbox:createLink>
          </div>
        </div>
      </g:ifAllGranted>
      <g:ifAnyGranted role="ROLE_AGENT,ROLE_BROKER,ROLE_PROVIDER">
        [RESPONSE FLAGGED BY ADMIN]
      </g:ifAnyGranted>
    </g:if>
    <g:if test="${!surveyResponse?.isHidden()}">
      <div class=answer>
        <%
          switch (question?.questionType) {
            case "SINGLE_CHOICE":
        %>
        <g:each in="${question?.answers?.sort{it?.sortOrder}}" status="k" var="answer">
          <g:radio class="radio" name="question_${question.id}" value="${answer.text}" checked="${surveyResponse?.text}"/>
          <g:fieldValue bean="${answer}" field="text"/>
          <br/>
        </g:each>
        <%
            break
            case "MULTI_CHOICE":
        %>
        <g:each in="${question?.answers?.sort{it?.sortOrder}}" status="k" var="answer">
          <g:checkBox class="checkbox" name="question_${question.id}" value="${answer.text}" checked="${surveyResponse?.text}"/>
          <g:fieldValue bean="${answer}" field="text"/>
          <br/>
        </g:each>
        <%
            break
            case "TEXTBOX":
            case "TEXTFIELD":
            default:
        %>
        <g:fieldValue bean="${surveyResponse}" field="text"/>
        <%
            break
          }
        %>
      </div>
    </g:if>
  </div>
</g:each>

