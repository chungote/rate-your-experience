
<%@ page import="survey.ReviewerCommentFlag" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        
        <g:set var="entityName" value="${message(code: 'reviewerCommentFlag.label', default: 'ReviewerCommentFlag')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                     
                       <tr class="prop">
			   <td valign="top" class="name"><g:message code="reviewerCommentFlag.comments.label" default="Created By" /></td>

			   <td valign="top" class="value">${fieldValue(bean: reviewerCommentFlagInstance, field: "createdBy.username")}</td>

                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reviewerCommentFlag.comments.label" default="Comments" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: reviewerCommentFlagInstance, field: "comments")}</td>
                            
                        </tr>
                    <g:ifAllGranted role="ROLE_ADMIN">
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reviewerCommentFlag.commentsResponse.label" default="Comments Response" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: reviewerCommentFlagInstance, field: "commentsResponse")}</td>
                            
                        </tr>
                            <tr class="prop">
			    <td valign="top" class="name"><g:message code="reviewerCommentFlag.commentsResponse.label" default="Reviewed By" /></td>

			    <td valign="top" class="value">${fieldValue(bean: reviewerCommentFlagInstance, field: "reviewedBy.username")}</td>

                        </tr>
                    </g:ifAllGranted>
                     <tr class="prop">
			<td valign="top" class="name"><g:message code="reviewerCommentFlag.flag.label" default="Flagged as Hidden" /></td>

			<td valign="top" class="value"><g:formatBoolean boolean="${reviewerCommentFlagInstance?.flag}" /></td>

                        </tr>
                        
                    </tbody>
                </table>
            </div>
            <modalbox:createLink  action="listReview" id="${reviewerCommentFlagInstance?.questionResponse?.id}" title="Flagged Comment List" width="500">	
                <i><u>Return to Review List</u></i>
	     </modalbox:createLink>
           </div>
    </body>
</html>
