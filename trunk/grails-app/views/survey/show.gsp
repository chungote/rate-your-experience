
<%@ page import="survey.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link controller="surveyResponse" action="preview" id="${surveyInstance.id}">Preview Survey</g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                      
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="survey.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: surveyInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="survey.welcome.label" default="Welcome" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: surveyInstance, field: "welcome")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="survey.thankYou.label" default="Thank You" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: surveyInstance, field: "thankYou")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="survey.groups.label" default="Groups" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${surveyInstance.groups}" var="g">
                                    <li><g:link controller="questionGroup" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="survey.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value">${surveyInstance?.dateCreated?.format("yyyy-MM-dd")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="survey.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${surveyInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
                <p>To add or edit Question Groups to this Survey, click the "Edit" button.</p>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${surveyInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    
                </g:form>
            </div>
        </div>
    </body>
</html>
