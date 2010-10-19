
<%@ page import="survey.QuestionGroup" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'questionGroup.label', default: 'QuestionGroup')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'questionGroup.id.label', default: 'Id')}" />
                        
                            <th><g:message code="questionGroup.survey.label" default="Survey" /></th>
                   	    
                            <g:sortableColumn property="sortOrder" title="${message(code: 'questionGroup.sortOrder.label', default: 'Sort Order')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'questionGroup.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'questionGroup.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'questionGroup.dateCreated.label', default: 'Date Created')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${questionGroupInstanceList}" status="i" var="questionGroupInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${questionGroupInstance.id}">${fieldValue(bean: questionGroupInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: questionGroupInstance, field: "survey")}</td>
                        
                            <td>${fieldValue(bean: questionGroupInstance, field: "sortOrder")}</td>
                        
                            <td>${fieldValue(bean: questionGroupInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: questionGroupInstance, field: "description")}</td>
                        
                            <td>${questionGroupInstance.dateCreated?.format("yyyy-MM-dd")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${questionGroupInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
