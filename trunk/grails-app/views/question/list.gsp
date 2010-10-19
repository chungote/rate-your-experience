
<%@ page import="survey.Question" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'question.id.label', default: 'Id')}" />
                        
                            <th><g:message code="question.group.label" default="Group" /></th>
                   	    
                            <g:sortableColumn property="sortOrder" title="${message(code: 'question.sortOrder.label', default: 'Sort Order')}" />
                        
                            <g:sortableColumn property="text" title="${message(code: 'question.text.label', default: 'Text')}" />
                        
                            <g:sortableColumn property="header" title="${message(code: 'question.header.label', default: 'Header')}" />
                        
                            <g:sortableColumn property="help" title="${message(code: 'question.help.label', default: 'Help')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${questionInstanceList}" status="i" var="questionInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${questionInstance.id}">${fieldValue(bean: questionInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: questionInstance, field: "group")}</td>
                        
                            <td>${fieldValue(bean: questionInstance, field: "sortOrder")}</td>
                        
                            <td>${fieldValue(bean: questionInstance, field: "text")}</td>
                        
                            <td>${fieldValue(bean: questionInstance, field: "header")}</td>
                        
                            <td>${fieldValue(bean: questionInstance, field: "help")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${questionInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
