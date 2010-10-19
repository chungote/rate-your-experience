
<%@ page import="system.TermsOfService" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'termsOfService.label', default: 'TermsOfService')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">Create a new Terms of Service</g:link></span>
        </div>
        <div class="body">
            <h1>Terms of Service List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                             <g:sortableColumn property="type" title="${message(code: 'termsOfService.type.label', default: 'Type')}" />
                        
                             <g:sortableColumn property="lastUpdated" title="${message(code: 'termsOfService.lastUpdated.label', default: 'Last Updated')}" />
                        
                             <g:sortableColumn property="modifiedBy" title="${message(code: 'termsOfService.modifiedBy.label', default: 'Modified By')}" />
                        
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${termsOfServiceInstanceList}" status="i" var="termsOfServiceInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${termsOfServiceInstance.id}">${fieldValue(bean: termsOfServiceInstance, field: "type")}</g:link></td>
                            <td><g:link action="edit" id="${termsOfServiceInstance.id}"><g:formatDate date="${termsOfServiceInstance.lastUpdated}" /></g:link></td>
                            
                            <td><g:link action="edit" id="${termsOfServiceInstance.id}">${fieldValue(bean: termsOfServiceInstance, field: "modifiedBy")}</g:link></td>
                        
                            
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
          
        </div>
    </body>
</html>
