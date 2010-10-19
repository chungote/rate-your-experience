
<%@ page import="survey.ReviewerCommentFlag" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        
        <g:set var="entityName" value="${message(code: 'reviewerCommentFlag.label', default: 'Requests for Review and Comments')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                           <th><g:message code="reviewerCommentFlag.createdBy.label" default="Created By" /></th>
                   	  
                            <g:sortableColumn property="flag" title="${message(code: 'reviewerCommentFlag.flag.label', default: 'Flagged')}" />
                        
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'reviewerCommentFlag.lastUpdated.label', default: 'Last Updated')}" />
                        
                            
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${reviewerCommentFlagInstanceList}" status="i" var="reviewerCommentFlagInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                         <td>
                         	<modalbox:createLink  action="show" id="${reviewerCommentFlagInstance.id}" title="Flag Details" width="500">	
                         		${fieldValue(bean: reviewerCommentFlagInstance, field: "createdBy.username")}
                         	</modalbox:createLink></td>
                         <td>
				 <modalbox:createLink  action="show" id="${reviewerCommentFlagInstance.id}" title="Flag Details" width="500">	
					<g:formatBoolean boolean="${reviewerCommentFlagInstance.flag}" />
				 </modalbox:createLink>
                         </td>
                         <td>
				 <modalbox:createLink  action="show" id="${reviewerCommentFlagInstance.id}" title="Flag Details" width="500">	
					 <g:formatDate date="${reviewerCommentFlagInstance.lastUpdated}" />
				 </modalbox:createLink>
                         </td>
                        
                            
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
          
        </div>
    </body>
</html>
