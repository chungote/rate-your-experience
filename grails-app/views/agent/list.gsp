<%@ page import="participant.Agent" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'agent.label', default: 'Agent')}"/>
  <title><g:message code="default.list.label" args="[entityName]"/></title>
  <resource:rating skin="rating-small"/>
  <g:javascript library="prototype"/>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
</div>
<div class="body">
  <h1><g:message code="default.list.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="search">
    <g:formRemote name="search" update="updateMe" action="doSearch" url="${[action:'doSearch']}">
      Branch: <input name="companyName" type="text"></input>
      &nbsp;&nbsp;&nbsp;
            Agent Last Name: <input name="lastName" type="text"></input>
      <input type="submit" name="search" value="Search"/>
    </g:formRemote>
  </div>
  <div id="updateMe">Type part or all or the company name or agent last name and search.</div>

</div>

</body>
</html>
