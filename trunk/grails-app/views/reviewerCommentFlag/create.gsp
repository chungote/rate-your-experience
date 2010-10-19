
<%@ page import="survey.ReviewerCommentFlag" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <g:set var="entityName" value="${message(code: 'reviewerCommentFlag.label', default: 'ReviewerCommentFlag')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${reviewerCommentFlagInstance}">
            <div class="errors">
                <g:renderErrors bean="${reviewerCommentFlagInstance}" as="list" />
            </div>
            </g:hasErrors>
 
<div id="result">            
<g:formRemote name="myForm" url="[action:'save']" update="[success:'result']" onComplete="Modalbox.resizeToContent()">
            <g:hiddenField name="questionResponse_id" value="${questionResponseInstance?.id}" />
                
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="flag"><g:message code="reviewerCommentFlag.flag.label" default="Flag" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewerCommentFlagInstance, field: 'flag', 'errors')}">
                                    <g:checkBox name="flag" value="${reviewerCommentFlagInstance?.flag}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="comments"><g:message code="reviewerCommentFlag.comments.label" default="Comments" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewerCommentFlagInstance, field: 'comments', 'errors')}">
                                    <g:textField name="comments" maxlength="140" size="100" value="${reviewerCommentFlagInstance?.comments}" />
                                </td>
                            </tr>
                        <g:ifAllGranted role="ROLE_ADMIN">
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="commentsResponse"><g:message code="reviewerCommentFlag.commentsResponse.label" default="Admin Response" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewerCommentFlagInstance, field: 'commentsResponse', 'errors')}">
                                    <g:textField name="commentsResponse" maxlength="140" size="100" value="${reviewerCommentFlagInstance?.commentsResponse}" />
                                </td>
                            </tr>
                        </g:ifAllGranted>
                        
                        </tbody>
                    </table>
                </div>
                <input type="submit" value="Save Comment" />


</g:formRemote >

</div>
<div style="clear:both"> 
<a href="#" title="Close window" onclick="Modalbox.hide(); return false;">Close</a>
</div>
</div>
    </body>
</html>
