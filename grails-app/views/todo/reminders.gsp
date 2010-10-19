<ul>
  <li><g:link class="todoPending" controller="surveyResponse" action="pendingApprovalList">
  <g:ifAnyGranted role="ROLE_ADMIN">Surveys Pending Approval
  </g:ifAnyGranted>
  <g:ifAnyGranted role="ROLE_BROKER">Surveys Pending Agent Review
  </g:ifAnyGranted>
  <g:ifAnyGranted role="ROLE_AGENT">Surveys Pending Review
  </g:ifAnyGranted>
  (${reviewPendingTotal})</g:link></li>
  <li><g:link class="todoOverdue" controller="surveyInvitationRequest" action="nonResponderList">Overdue Information Requests (${agentNonResponderTotal})</g:link></li>
  <li><g:link class="todoIncomplete" controller="surveyInvitationRequest" action="incompleteSurveyList">Incomplete Surveys (${surveyPendingTotal})</g:link></li>
  <g:ifAnyGranted role="ROLE_ADMIN">
  <li><g:link class="todoFlagged" controller="surveyResponse" action="flaggedReviewList">Flagged for Review (${flaggedReviewTotal})</g:link></li>
  </g:ifAnyGranted>
</ul>
