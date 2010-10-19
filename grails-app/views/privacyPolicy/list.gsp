
<%@ page import="system.PrivacyPolicy" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'privacyPolicy.label', default: 'PrivacyPolicy')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">Create a new Privacy Policy</g:link></span>
        </div>
        <div class="body">
            <h1>Privacy Policy List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'privacyPolicy.lastUpdated.label', default: 'Last Updated')}" />
                        
                            <g:sortableColumn property="modifiedBy" title="${message(code: 'privacyPolicy.modifiedBy.label', default: 'Modified By')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${privacyPolicyInstanceList}" status="i" var="privacyPolicyInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${privacyPolicyInstance.id}">${fieldValue(bean: privacyPolicyInstance, field: "lastUpdated")}</g:link></td>
                        
                            <td><g:link action="edit" id="${privacyPolicyInstance.id}">${fieldValue(bean: privacyPolicyInstance, field: "modifiedBy")}</g:link></td>
                        
                            
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${privacyPolicyInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
