
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
	    	                			<td class="name">Notification Report for Broker:</td>
	    	                			<td class="value">${fieldValue(bean: brokerInstance, field: "companyName")}</td>
	    	                 		</tr>
	    	                 		<tr class="summary">
	    	    			         <td class="name">Address:</td>
	    	    			         <td class="value"> ${fieldValue(bean: brokerInstance, field: "streetAddress1")}<br/>
	    	    	                ${fieldValue(bean: brokerInstance, field: "city")},
	    	    	                ${fieldValue(bean: brokerInstance, field: "stateOrProvince")}&nbsp;&nbsp;
	    	    	                ${fieldValue(bean: brokerInstance, field: "zip")}</td>
	    	                 		</tr>
	    	                 		<tr class="summary">
	    	    				<td class="name">Phone:</td>
	    	    				<td class="value">${fieldValue(bean: brokerInstance, field: "officePhone")}</td>
	    	    			</tr>
	    	                 		<tr class="summary">
	    	    				<td class="name">MLS Status:</td>
	    	    				<td class="value">${fieldValue(bean: brokerInstance, field: "mlsStatus")}</td>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'notification.id.label', default: 'Notification Id')}" />
                            <g:sortableColumn property="listing.mlsNumber" title="${message(code: 'notification.listing.mlsNumber.label', default: 'MLS Number')}" />
                        
                            <g:sortableColumn property="flowState" title="${message(code: 'notification.flowState.label', default: 'Flow State')}" />
                        
                            <g:sortableColumn property="informationRequestedDate" title="${message(code: 'notification.informationRequestedDate.label', default: 'Information Requested Date')}" />
                        
                            <g:sortableColumn property="surveyRequestedDate" title="${message(code: 'notification.surveyRequestedDate.label', default: 'Survey Request Sent')}" />
                            <g:sortableColumn property="surveyCompletedDate" title="${message(code: 'notification.surveyCompletedDate.label', default: 'Response Date')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${notificationInstanceList}" status="i" var="notificationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${notificationInstance.id}">${fieldValue(bean: notificationInstance, field: "id")}</g:link></td>
                            <td><g:link controller="listing" action="show" id="${notificationInstance.listing.mlsNumber}">${fieldValue(bean: notificationInstance, field: "listing.mlsNumber")}</g:link></td>
                        
                            <td>${fieldValue(bean: notificationInstance, field: "flowState")}</td>
                                                                      
                            <td>${notificationInstance.informationRequestedDate?.format("yyyy-MM-dd")}</td>
                        
                            <td>${notificationInstance.surveyRequestedDate?.format("yyyy-MM-dd")}"</td>
                        <g:if test="${surveyCompletedDate!=null}">
                        <td><g:link action="show" id="${notificationInstance.surveyResponse.Id}">${fieldValue(bean: notificationInstance, field: "surveyCompletedDate")}</g:link></td>
                        </g:if>
                          <g:if test="${surveyCompletedDate==null}">
			                <td>${notificationInstance.surveyCompletedDate?.format("yyyy-MM-dd")} </td>
                        </g:if>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            
        </div>
    </body>
</html>
