
<%@ page import="transaction.RETransaction" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'RETransaction.label', default: 'RETransaction')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'RETransaction.id.label', default: 'Id')}" />
                        
                            <th><g:message code="RETransaction.listing.label" default="Listing" /></th>
                   	    
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'RETransaction.lastUpdated.label', default: 'Last Updated')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'RETransaction.dateCreated.label', default: 'Date Created')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${RETransactionInstanceList}" status="i" var="RETransactionInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${RETransactionInstance.id}">${fieldValue(bean: RETransactionInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: RETransactionInstance, field: "listing")}</td>
                        
                            <td><g:formatDate date="${RETransactionInstance.lastUpdated}" /></td>
                        
                            <td>${RETransactionInstance.dateCreated?.format("yyyy-MM-dd")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${RETransactionInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
