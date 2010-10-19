
<%@ page import="system.PrivacyPolicy" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'privacyPolicy.label', default: 'PrivacyPolicy')}" />
        <title>Privacy Policy</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Back to list</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">Create a new Privacy Policy</g:link></span>
        </div>
        <div class="body">
            <h1>Privacy Policy</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                    
                    
                        <tr class="prop">
	                                <td valign="top" class="name"><g:message code="privacyPolicy.lastUpdated.label" default="Last Updated" /></td>
	                                
	                                <td valign="top" class="value"><g:formatDate date="${privacyPolicyInstance?.lastUpdated}" /></td>
	                                
	                            </tr>
            
            
            		<tr class="prop">
                            <td valign="top" class="name"><g:message code="privacyPolicy.modifiedBy.label" default="Modified By" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: privacyPolicyInstance, field: "modifiedBy")}</td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="privacyPolicy.content.label" default="Content" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: privacyPolicyInstance, field: "content")}</td>
                            
                        </tr>
                    
                    
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${privacyPolicyInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                   
                </g:form>
            </div>
        </div>
    </body>
</html>
