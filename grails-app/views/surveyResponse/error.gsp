<%@ page import="survey.SurveyResponse" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'surveyResponse.label', default: 'Survey Response')}"/>
  <title><g:message code="default.list.label" args="[entityName]"/></title>
  <resource:rating skin="rating-small"/>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
  <span class="menuButton"><g:link class="search" action="search">Back to Search</g:link></span>
</div>
<div class="body">
  <h1><g:message code="default.list.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
 
</div>
</body>
</html>
