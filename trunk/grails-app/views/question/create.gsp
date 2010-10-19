
<%@ page import="survey.Question" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
             <g:link controller="survey" action="show" id="${questionInstance?.group?.survey.id}">Back to Survey</g:link>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${questionInstance}">
            <div class="errors">
                <g:renderErrors bean="${questionInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="group"><g:message code="question.group.label" default="Group" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: questionInstance, field: 'group', 'errors')}">
                                 <g:link controller="questionGroup" action="show" id="${questionInstance?.group.id}">${questionInstance?.group.encodeAsHTML()}</g:link>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sortOrder"><g:message code="question.sortOrder.label" default="Sort Order" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: questionInstance, field: 'sortOrder', 'errors')}">
                                    <g:textField name="sortOrder" value="${fieldValue(bean: questionInstance, field: 'sortOrder')}" />
                                
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="text"><g:message code="question.text.label" default="Question Text" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: questionInstance, field: 'text', 'errors')}">
                                    <g:textField name="text" value="${questionInstance?.text}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="header"><g:message code="question.header.label" default="Question Heading" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: questionInstance, field: 'header', 'errors')}">
                                    <g:textField name="header" value="${questionInstance?.header}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="help"><g:message code="question.help.label" default="Help Text" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: questionInstance, field: 'help', 'errors')}">
                                    <g:textField name="help" value="${questionInstance?.help}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="questionType"><g:message code="question.questionType.label" default="Question Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: questionInstance, field: 'questionType', 'errors')}">
                                    <g:select name="questionType" from="${questionInstance.constraints.questionType.inList}" value="${questionInstance?.questionType}" valueMessagePrefix="question.questionType"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="textBoxSize"><g:message code="question.textBoxSize.label" default="Text Box Size" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: questionInstance, field: 'textBoxSize', 'errors')}">
                                    <g:textField name="textBoxSize" value="${fieldValue(bean: questionInstance, field: 'textBoxSize')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="textFieldSize"><g:message code="question.textFieldSize.label" default="Text Field Size" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: questionInstance, field: 'textFieldSize', 'errors')}">
                                    <g:textField name="textFieldSize" value="${fieldValue(bean: questionInstance, field: 'textFieldSize')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="rateable"><g:message code="question.rateable.label" default="Rateable" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: questionInstance, field: 'rateable', 'errors')}">
                                    <g:checkBox name="rateable" value="${questionInstance?.rateable}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="required"><g:message code="question.required.label" default="Required" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: questionInstance, field: 'required', 'errors')}">
                                    <g:checkBox name="required" value="${questionInstance?.required}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
                <g:hiddenField name="group.id" value="${questionInstance?.group.id}"/>
            </g:form>
        </div>
    </body>
</html>
