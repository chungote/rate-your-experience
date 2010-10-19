<%@ page import="participant.Agent" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'agent.label', default: 'Agent')}"/>
  <title><g:message code="default.list.label" args="[entityName]"/></title>
  <resource:rating skin="rating-trans"/>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">New Search</a></span>

</div>
<div class="body">
  <h1>Agent List /></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="list">
    <table>
      <thead>
      <tr>

        <g:sortableColumn property="ratingAverage" title="${message(code: 'agent.ratingAverage.label', default: 'Average Rating')}"/>

        <g:sortableColumn property="lastName" title="${message(code: 'agent.lastName.label', default: 'Last Name')}"/>

        <g:sortableColumn property="firstName" title="${message(code: 'agent.firstName.label', default: 'First Name')}"/>

        <g:sortableColumn property="companyName" title="${message(code: 'agent.companyName.label', default: 'Company Name')}"/>

        <g:sortableColumn property="streetAddress1" title="${message(code: 'agent.streetAddress1.label', default: 'Address')}"/>

        <g:sortableColumn property="city" title="${message(code: 'agent.city.label', default: 'City')}"/>

        <g:sortableColumn property="zip" title="${message(code: 'agent.zip.label', default: 'Zip')}"/>

      </tr>
      </thead>
      <tbody>
      <g:each in="${agentInstanceList}" status="i" var="agentInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
          <td>
            <div class="sResponse">
              <richui:rating dynamic="false" rating="${agentInstance.ratingAverage}" units="5" showCurrent="false"/>
            </div>
          </td>
          <td><g:link action="show" id="${agentInstance.id}">${fieldValue(bean: agentInstance, field: "lastName")}</g:link></td>

          <td><g:link action="show" id="${agentInstance.id}">${fieldValue(bean: agentInstance, field: "firstName")}</g:link></td>

          <td><g:link action="show" id="${agentInstance.id}">${fieldValue(bean: agentInstance, field: "companyName")}</g:link></td>

          <td><g:link action="show" id="${agentInstance.id}">${fieldValue(bean: agentInstance, field: "streetAddress1")}</g:link></td>

          <td><g:link action="show" id="${agentInstance.id}">${fieldValue(bean: agentInstance, field: "city")}</g:link></td>

          <td><g:link action="show" id="${agentInstance.id}">${fieldValue(bean: agentInstance, field: "zip")}</g:link></td>

        </tr>
      </g:each>
      </tbody>
    </table>
  </div>

</div>
</body>
</html>
