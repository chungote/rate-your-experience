
<%@ page import="notification.Notification" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'notification.label', default: 'Notification')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
           
        </div>
        <div class="body">
            <h1>Survey Responses Pending Review</h1>
                   
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            
                            <g:sortableColumn property="listing.mlsNumber" title="${message(code: 'notification.listing.mlsNumber.label', default: 'MLS Number')}" />
                        
                            <g:sortableColumn property="flowState" title="${message(code: 'notification.flowState.label', default: 'Flow State')}" />
                        
                            <g:sortableColumn property="surveyCompletedDate" title="${message(code: 'notification.surveyCompletedDate.label', default: 'Response Completed Date')}" />
                            <g:sortableColumn property="adminReviewedSurveyDate" title="${message(code: 'notification.adminReviewedSurveyDate.label', default: 'Approval Date')}" />
                        
                          
                            
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:if test="${surveyResponseId!=null&&adminReviewedSurveyDate==null}">
                    <g:each in="${notificationInstanceList}" status="i" var="notificationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            
                            <td><g:link controller="surveyResponse" action="edit" id="${notificationInstance.surveyResponseId}">${fieldValue(bean: notificationInstance, field: "listing.mlsNumber")}</g:link></td>
                        
                            <td>${fieldValue(bean: notificationInstance, field: "flowState")}</td>
                                                                      
                            <td>${notificationInstance.surveyCompletedDate?.format("yyyy-MM-dd")}</td>
                        
                            <td>${notificationInstance.adminReviewedSurveyDate?.format("yyyy-MM-dd")}</td>
                        
                       <% /* include "are you sure" confirmation on approval button make tab -pending/approved*/%>
                        </tr>
                    </g:each>
                    </g:if>
                    </tbody>
                </table>
            </div>

        </div>
    </body>
</html>
