
<%@ page import="transaction.Listing" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'listing.label', default: 'Listing')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'listing.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="mlsNumber" title="${message(code: 'listing.mlsNumber.label', default: 'Mls Number')}" />
                        
                            <g:sortableColumn property="listDate" title="${message(code: 'listing.listDate.label', default: 'List Date')}" />
                        
                            <g:sortableColumn property="closedDate" title="${message(code: 'listing.closedDate.label', default: 'Closed Date')}" />
                        
                            <g:sortableColumn property="listPrice" title="${message(code: 'listing.listPrice.label', default: 'List Price')}" />
                        
                            <g:sortableColumn property="soldPrice" title="${message(code: 'listing.soldPrice.label', default: 'Sold Price')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${listingInstanceList}" status="i" var="listingInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${listingInstance.id}">${fieldValue(bean: listingInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: listingInstance, field: "mlsNumber")}</td>
                        
                            <td><g:formatDate date="${listingInstance.listDate}" /></td>
                        
                            <td><g:formatDate date="${listingInstance.closedDate}" /></td>
                        
                            <td>${fieldValue(bean: listingInstance, field: "listPrice")}</td>
                        
                            <td>${fieldValue(bean: listingInstance, field: "soldPrice")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${listingInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
