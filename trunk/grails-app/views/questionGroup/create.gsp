
<%@ page import="survey.QuestionGroup" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'questionGroup.label', default: 'QuestionGroup')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <g:link controller="survey" action="show" id="${questionGroupInstance?.survey.id}">Back to Survey</g:link>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${questionGroupInstance}">
            <div class="errors">
                <g:renderErrors bean="${questionGroupInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="survey"><g:message code="questionGroup.survey.label" default="Survey" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: questionGroupInstance, field: 'survey', 'errors')}">
                                   <g:link controller="survey" action="show" id="${questionGroupInstance?.survey?.id}">${questionGroupInstance?.survey?.encodeAsHTML()}</g:link>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sortOrder"><g:message code="questionGroup.sortOrder.label" default="Sort Order" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: questionGroupInstance, field: 'sortOrder', 'errors')}">
                                    <g:textField name="sortOrder" value="${fieldValue(bean: questionGroupInstance, field: 'sortOrder')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="questionGroup.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: questionGroupInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${questionGroupInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="questionGroup.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: questionGroupInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${questionGroupInstance?.description}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
                <g:hiddenField name="survey.id" value="${questionGroupInstance?.survey?.id}"/>
            </g:form>
        </div>
    </body>
</html>
