
<%@ page import="notification.SurveyInvitationRequest" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'surveyInvitationRequest.label', default: 'SurveyInvitationRequest')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
           
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
                        
                            <th><g:message code="surveyInvitationRequest.notification.listing.mlsNumber.label" default="MLS Number" /></th>
                   	    <th><g:message code="surveyInvitationRequest.notification.listing.sellingAgent.label" default="Agent" /></th>
                            <g:sortableColumn property="clientName" title="${message(code: 'surveyInvitationRequest.clientName.label', default: 'Client Name')}" />
                            <g:sortableColumn property="clientEmail" title="${message(code: 'surveyInvitationRequest.clientName.label', default: 'Client Email')}" />
                        <th><g:message code="surveyInvitationRequest.notification.surveyRequestDate.label" default="Date Sent" /></th>
                            <th><g:message code="surveyInvitationRequest.notification.listing.closedDate.label" default="Sold Date" /></th>
                   	    
                            <th><g:message code="surveyInvitationRequest.notification.surveyCompletedDate.label" default="Response Date" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${surveyInvitationRequestInstanceList}" status="i" var="surveyInvitationRequestInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${surveyInvitationRequestInstance.id}">${fieldValue(bean: surveyInvitationRequestInstance, field: "notification.listing.mlsNumber")}</g:link></td>
                        
                        <td><g:link controller="agent" action="show" id="${surveyInvitationRequestInstance.notification.listing.sellingAgent.id}">${fieldValue(bean: surveyInvitationRequestInstance, field: "notification.listing.sellingAgent.firstName")} &nbsp; ${fieldValue(bean: surveyInvitationRequestInstance, field: "notification.listing.sellingAgent.lastName")}</g:link></td>
                                                
                            <td>${fieldValue(bean: surveyInvitationRequestInstance, field: "clientName")}</td>
                        
                            <td>${fieldValue(bean: surveyInvitationRequestInstance, field: "clientEmail")}</td>
                        
                            <td>${surveyInvitationRequestInstance.surveyRequestDate?.format("yyyy-MM-dd")}</td>
                        
                            <td>${surveyInvitationRequestInstance.notification.listing.closedDate?.format("yyyy-MM-dd")}</td>
                            
                            <td>${surveyInvitationRequestInstance.surveyCompletedDate?.format("yyyy-MM-dd")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
           
        </div>
    </body>
</html>
