
<%@ page import="survey.Answer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'answer.label', default: 'Answer')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'answer.id.label', default: 'Id')}" />
                        
                            <th><g:message code="answer.question.label" default="Question" /></th>
                   	    
                            <g:sortableColumn property="sortOrder" title="${message(code: 'answer.sortOrder.label', default: 'Sort Order')}" />
                        
                            <g:sortableColumn property="text" title="${message(code: 'answer.text.label', default: 'Text')}" />
                        
                            <g:sortableColumn property="defaultAnswer" title="${message(code: 'answer.defaultAnswer.label', default: 'Default Answer')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'answer.dateCreated.label', default: 'Date Created')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${answerInstanceList}" status="i" var="answerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${answerInstance.id}">${fieldValue(bean: answerInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: answerInstance, field: "question")}</td>
                        
                            <td>${fieldValue(bean: answerInstance, field: "sortOrder")}</td>
                        
                            <td>${fieldValue(bean: answerInstance, field: "text")}</td>
                        
                            <td><g:formatBoolean boolean="${answerInstance.defaultAnswer}" /></td>
                        
                            <td>${answerInstance.dateCreated?.format("yyyy-MM-dd")} /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${answerInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
