
<%@ page import="notification.Notification" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'notification.label', default: 'Notification')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
          
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                   <div>
	    	                <table class="summary">
	    	                	<tbody>
	    	                		<tr class="summary">
	    	                			<td class="name">Pending Requests for Information for Agent:</td>
	    	                			<td class="value">${fieldValue(bean: agentInstance, field: "firstName")}&nbsp;${fieldValue(bean: agentInstance, field: "lastName")}</td>
	    	                			
	    	                 		</tr>
	    	                 		<tr class="summary">
	    	                 			<td class="name">Company:</td>
	    	                			<td class="value">${fieldValue(bean: agentInstance, field: "companyName")}</td>
	    	                 		</tr>
	    	                 		<tr class="summary">
	    	    			         <td class="name">Address:</td>
	    	    			         <td class="value"> ${fieldValue(bean: agentInstance, field: "streetAddress1")}<br/>
	    	    	                ${fieldValue(bean: agentInstance, field: "city")},
	    	    	                ${fieldValue(bean: agentInstance, field: "stateOrProvince")}&nbsp;&nbsp;
	    	    	                ${fieldValue(bean: agentInstance, field: "zip")}</td>
	    	                 		</tr>
	    	                 		<tr class="summary">
	    	    				<td class="name">Phone:</td>
	    	    				<td class="value">${fieldValue(bean: agentInstance, field: "officePhone")}</td>
	    	    			</tr>
	    	                 		<tr class="summary">
	    	    				<td class="name">MLS Status:</td>
	    	    				<td class="value">${fieldValue(bean: agentInstance, field: "mlsStatus")}</td>
	    	                 		</tr>
	    	                 			             		</tr>
	    					           </tbody>
	               </table>
            </div>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            
                            <g:sortableColumn property="listing.mlsNumber" title="${message(code: 'notification.listing.mlsNumber.label', default: 'MLS Number')}" />
                        
                            <g:sortableColumn property="flowState" title="${message(code: 'notification.flowState.label', default: 'Flow State')}" />
                        
                            <g:sortableColumn property="informationRequestedDate" title="${message(code: 'notification.informationRequestedDate.label', default: 'Information Requested Date')}" />
                        
                            <g:sortableColumn property="informationDueDate" title="${message(code: 'notification.informationDueDate.label', default: 'Information Due Date')}" />
                            
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:if test="${informationRequestCompletedDate==null}">
                    <g:each in="${notificationInstanceList}" status="i" var="notificationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            
                            <td><g:link controller="surveyInvitationRequest" action="create" notificationId="${notificationInstance.id}">${fieldValue(bean: notificationInstance, field: "listing.mlsNumber")}</g:link></td>
                        
                            <td>${fieldValue(bean: notificationInstance, field: "flowState")}</td>
                                                                      
                            <td>${notificationInstance.informationRequestedDate?.format("yyyy-MM-dd")}</td>
                        
                            <td>${notificationInstance.informationDueDate?.format("yyyy-MM-dd")}</td>
                        
                       
                        </tr>
                    </g:each>
                    </g:if>
                    </tbody>
                </table>
            </div>

        </div>
    </body>
</html>
