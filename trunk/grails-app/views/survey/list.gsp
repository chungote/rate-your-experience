<%@ page import="survey.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
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
                        
                            <g:sortableColumn property="name" title="${message(code: 'survey.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="welcome" title="${message(code: 'survey.welcome.label', default: 'Welcome')}" />
                        
                            <g:sortableColumn property="thankYou" title="${message(code: 'survey.thankYou.label', default: 'Thank You')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'survey.dateCreated.label', default: 'Date Created')}" />
                        
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'survey.lastUpdated.label', default: 'Last Updated')}" />
                        
                        </tr>
                    </thead>
                    <tbody >
                    <g:each in="${surveyInstanceList}" status="i" var="surveyInstance">
                        
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link  action="edit" id="${surveyInstance.id}">${fieldValue(bean: surveyInstance, field: "name").decodeHTML()}</g:link></td>
                        
                            <td><g:link  action="edit" id="${surveyInstance.id}">${fieldValue(bean: surveyInstance, field: "welcome").decodeHTML()}</g:link></td>
                        
                            <td><g:link  action="edit" id="${surveyInstance.id}">${fieldValue(bean: surveyInstance, field: "thankYou").decodeHTML()}</g:link></td>
                        
                            <td><g:link  action="edit" id="${surveyInstance.id}">${surveyInstance.dateCreated?.format("yyyy-MM-dd")}</g:link></td>
                        
                            <td><g:link  action="edit" id="${surveyInstance.id}"><g:formatDate date="${surveyInstance.lastUpdated}" /></g:link></td>
                            <td><g:link  controller="surveyResponse" action="preview" id="${surveyInstance.id}">Preview</g:link></td>
                        
                        </tr>
                        
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${surveyInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
