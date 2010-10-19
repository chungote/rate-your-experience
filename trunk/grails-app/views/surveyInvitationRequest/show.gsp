
<%@ page import="notification.SurveyInvitationRequest" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'surveyInvitationRequest.label', default: 'SurveyInvitationRequest')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
              </div>
        <div class="body">
            <h1>Survey Invitation Request</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="surveyInvitationRequest.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: surveyInvitationRequestInstance, field: "id")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="surveyInvitationRequest.survey.label" default="Survey" /></td>

                            <td valign="top" class="value"><g:link controller="survey" action="show" id="${surveyInvitationRequestInstance?.survey?.id}">${surveyInvitationRequestInstance?.survey?.name?.decodeHTML()}</g:link></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="surveyInvitationRequest.notification.label" default="Notification for MLS Number" /></td>

                            <td valign="top" class="value"><g:link controller="notification" action="show" id="${surveyInvitationRequestInstance?.notification?.id}">${surveyInvitationRequestInstance?.notification?.listing?.mlsNumber?.encodeAsHTML()}</g:link></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="surveyInvitationRequest.clientName.label" default="Client Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: surveyInvitationRequestInstance, field: "clientName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="surveyInvitationRequest.clientEmail.label" default="Client Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: surveyInvitationRequestInstance, field: "clientEmail")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="surveyInvitationRequest.lender.label" default="Lender" /></td>
                            
                            <td valign="top" class="value"><g:link controller="serviceProvider" action="show" id="${surveyInvitationRequestInstance?.lender?.id}">${surveyInvitationRequestInstance?.lender?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="surveyInvitationRequest.houseInspector.label" default="House Inspector" /></td>
                            
                            <td valign="top" class="value"><g:link controller="serviceProvider" action="show" id="${surveyInvitationRequestInstance?.houseInspector?.id}">${surveyInvitationRequestInstance?.houseInspector?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="surveyInvitationRequest.radonInspector.label" default="Radon Inspector" /></td>
                            
                            <td valign="top" class="value"><g:link controller="serviceProvider" action="show" id="${surveyInvitationRequestInstance?.radonInspector?.id}">${surveyInvitationRequestInstance?.radonInspector?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="surveyInvitationRequest.termiteInspector.label" default="Termite Inspector" /></td>
                            
                            <td valign="top" class="value"><g:link controller="serviceProvider" action="show" id="${surveyInvitationRequestInstance?.termiteInspector?.id}">${surveyInvitationRequestInstance?.termiteInspector?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="surveyInvitationRequest.moldInspector.label" default="Mold Inspector" /></td>
                            
                            <td valign="top" class="value"><g:link controller="serviceProvider" action="show" id="${surveyInvitationRequestInstance?.moldInspector?.id}">${surveyInvitationRequestInstance?.moldInspector?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="surveyInvitationRequest.attorney.label" default="Attorney" /></td>
                            
                            <td valign="top" class="value"><g:link controller="serviceProvider" action="show" id="${surveyInvitationRequestInstance?.attorney?.id}">${surveyInvitationRequestInstance?.attorney?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="surveyInvitationRequest.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${surveyInvitationRequestInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="surveyInvitationRequest.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value">${surveyInvitationRequestInstance?.dateCreated?.format("yyyy-MM-dd")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>

            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${surveyInvitationRequestInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                </g:form>
            </div>

            <div class="actions">
                <span class="faux-button">
                <g:link action="agentCompletesResponseEvent" params="[id:surveyInvitationRequestInstance?.id, notificationId:surveyInvitationRequestInstance.notification.id]">
                    Send Survey Request to Client
                </g:link>
                </span>
            </div>
            
        </div>
    </body>
</html>
