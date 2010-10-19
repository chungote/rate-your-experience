
<%@ page import="transaction.RETransaction" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'RETransaction.label', default: 'RETransaction')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${RETransactionInstance}">
            <div class="errors">
                <g:renderErrors bean="${RETransactionInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${RETransactionInstance?.id}" />
                <g:hiddenField name="version" value="${RETransactionInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="listing"><g:message code="RETransaction.listing.label" default="Listing" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: RETransactionInstance, field: 'listing', 'errors')}">
                                    <g:select name="listing.id" from="${transaction.Listing.list()}" optionKey="id" value="${RETransactionInstance?.listing?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="serviceProviders"><g:message code="RETransaction.serviceProviders.label" default="Service Providers" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: RETransactionInstance, field: 'serviceProviders', 'errors')}">
                                    <g:select name="serviceProviders" from="${participant.ServiceProvider.list()}" multiple="yes" optionKey="id" size="5" value="${RETransactionInstance?.serviceProviders}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
