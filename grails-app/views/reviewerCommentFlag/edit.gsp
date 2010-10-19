
<%@ page import="survey.ReviewerCommentFlag" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <g:set var="entityName" value="${message(code: 'reviewerCommentFlag.label', default: 'Review and Respond to Flagged Response')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${reviewerCommentFlagInstance}">
            <div class="errors">
                <g:renderErrors bean="${reviewerCommentFlagInstance}" as="list" />
            </div>
            </g:hasErrors>
      <div id="result">            
	<g:formRemote name="myForm" url="[action:'update']" update="[success:'result']" onComplete="Modalbox.resizeToContent()">
         <g:hiddenField name="id" value="${reviewerCommentFlagInstance?.id}" />
                <g:hiddenField name="version" value="${reviewerCommentFlagInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="comments"><g:message code="reviewerCommentFlag.comments.label" default="Comments" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewerCommentFlagInstance, field: 'comments', 'errors')}">
                                   ${fieldValue(bean: reviewerCommentFlagInstance, field: "comments")}
                                </td>
                            </tr>
                        
                        	<tr class="prop">
			                                <td valign="top" class="name">
			                                  <label for="createdBy"><g:message code="reviewerCommentFlag.createdBy.label" default="Created By" /></label>
			                                </td>
			                                <td valign="top" class="value ${hasErrors(bean: reviewerCommentFlagInstance, field: 'createdBy', 'errors')}">
			                                ${fieldValue(bean: reviewerCommentFlagInstance, field: "createdBy.username")}
			                                </td>
                            </tr>
                        
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
                                  <label for="commentsResponse"><g:message code="reviewerCommentFlag.commentsResponse.label" default="Comments Response" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewerCommentFlagInstance, field: 'commentsResponse', 'errors')}">
                                    <g:textField name="commentsResponse" maxlength="140" size="100" value="${reviewerCommentFlagInstance?.commentsResponse}" />
                                </td>
                            </tr>
                        
                           
                            
                        
                             
                        </tbody>
                    </table>
                </div>
                             <input type="submit" value="Save Review" />
	       
	       
</g:formRemote >
        </div>
    </body>
</html>
