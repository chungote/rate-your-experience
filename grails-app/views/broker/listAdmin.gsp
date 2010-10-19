
<%@ page import="participant.Broker" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'broker.label', default: 'Broker')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="companyName" title="${message(code: 'broker.id.label', default: 'Brokerage')}" />
                           <th>Agent Last Name</th>
 			<th>Agent First Name </th>                       
                            
                        </tr>
                    </thead>
                    <tbody>
                    <% def start=0 %>
                    <g:each in="${brokerInstanceList.sort{it.companyName}}" status="i" var="brokerInstance">
                        
			      
			<g:each in="${brokerInstance.agents.sort{it.lastName}}" status="j" var="agent">
			<% if (j==0) {
				start=start+1
				}
			%>
                        <tr class="${(start % 2) == 0 ? 'odd' : 'even'}">
                        <td><g:link action="show" id="${brokerInstance.id}">${fieldValue(bean: brokerInstance, field: "companyName")}</g:link></td>
                            <td> <g:link controller="agent" action="show" id="${agent.id}">${fieldValue(bean: agent, field: "lastName")}</g:link></td>
                        <td>${fieldValue(bean: agent, field: "firstName")}</td>
                        <td> <g:link controller="listing" action="report" id="${agent.mlsAgentId}">Listings</g:link></td>
                        <td> <g:link controller="surveyResponse" action="report" id="${agent.mlsAgentId}">Responses</g:link></td>
                         </tr>
                        
			</g:each>                         
                       
                                            
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${brokerInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
