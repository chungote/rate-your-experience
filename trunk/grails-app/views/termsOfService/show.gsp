
<%@ page import="system.TermsOfService" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'termsOfService.label', default: 'TermsOfService')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Back to list</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">Create a new Terms of Service</g:link></span>
        </div>
        <div class="body">
            <h1>Terms of Service</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                               <tr class="prop">
		                              <td valign="top" class="name"><g:message code="termsOfService.type.label" default="Type" /></td>
		                              
		                              <td valign="top" class="value">${fieldValue(bean: termsOfServiceInstance, field: "type")}</td>
		                              
		                          </tr>
                 <tr class="prop">
	                               <td valign="top" class="name"><g:message code="termsOfService.lastUpdated.label" default="Last Updated" /></td>
	                               
	                               <td valign="top" class="value"><g:formatDate date="${termsOfServiceInstance?.lastUpdated}" /></td>
	                               
	                           </tr>
                  
                  <tr class="prop">
                            <td valign="top" class="name"><g:message code="termsOfService.content.label" default="Content" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: termsOfServiceInstance, field: "content")}</td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="termsOfService.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: termsOfServiceInstance, field: "description")}</td>
                            
                        </tr>
                    
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="termsOfService.modifiedBy.label" default="Modified By" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: termsOfServiceInstance, field: "modifiedBy")}</td>
                            
                        </tr>
                    
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${termsOfServiceInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    
                </g:form>
            </div>
        </div>
    </body>
</html>
