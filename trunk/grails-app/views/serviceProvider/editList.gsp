<%@ page import="participant.ServiceProvider" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'serviceProvider.label', default: 'Service Provider')}"/>
  <title><g:message code="default.list.label" args="[entityName]"/></title>
  <resource:rating skin="rating-small"/>
  <g:javascript library="prototype"/>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
   <span class="menuButton"><g:link class="create" action="create">Create New Service Provider</g:link></span>
</div>
<div class="body">
  <h1><g:message code="default.list.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="editSearch">
    <g:formRemote name="editSearch" update="updateMe" action="doEditSearch" url="${[action:'doEditSearch']}">
      Company: <input name="companyName" type="text"></input>
     
      <input type="submit" name="editSearch" value="Search"/>
    </g:formRemote>
  </div>
  <div id="updateMe">Type part or all or the company name or provider first or last name and search.</div>

</div>

</body>
</html>
