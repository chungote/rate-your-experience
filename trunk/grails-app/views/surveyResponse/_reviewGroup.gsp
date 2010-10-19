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
      <div id="star_div_${question.id}">
        <richui:rating dynamic="false" rating="${surveyResponse?.rating}" units="5"/>
      </div>
    </g:if>
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
        <g:if test="${surveyResponse?.hasReviewRequest()}">
          <g:ifAnyGranted role="ROLE_AGENT,ROLE_BROKER">
            [FLAGGED FOR ADMIN REVIEW]
          </g:ifAnyGranted>
          <g:ifAllGranted role="ROLE_ADMIN">
            <modalbox:createLink controller="reviewerCommentFlag" action="listReview" id="${surveyResponse?.id}" title="Flagged Comment List" width="500">
              <i><u>Flagged for Admin Review - Click Here To View/Review</u></i>
            </modalbox:createLink>
          </g:ifAllGranted>
        </g:if>
      </div>
      <div>
        <modalbox:createLink controller="reviewerCommentFlag" action="create" id="${surveyResponse?.id}" title="Flag Response" width="500">
          <i><u>Click Here To Flag This Response</u></i>
        </modalbox:createLink>
      </div>
    </div>
  </div>
</g:each>

