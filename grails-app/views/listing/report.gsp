
<%@ page import="transaction.Listing" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'listing.label', default: 'Listing')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
           
        </div>
        <div class="body">
            <h1>Listing Report for Agent: ${fieldValue(bean: agentInstance, field: "firstName")},${fieldValue(bean: agentInstance, field: "lastName")}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
          

            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'listing.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="mlsNumber" title="${message(code: 'listing.mlsNumber.label', default: 'Mls Number')}" />
                        
                            <g:sortableColumn property="streetAddress" title="${message(code: 'listing.streetAddress.label', default: 'Street Address')}" />
                        
                        <g:sortableColumn property="city" title="${message(code: 'listing.city.label', default: 'City')}" />

<g:sortableColumn property="zip" title="${message(code: 'listing.zip.label', default: 'Zip')}" />

                            <g:sortableColumn property="closedDate" title="${message(code: 'listing.closedDate.label', default: 'Closed Date')}" />
                                                  
                            <g:sortableColumn property="soldPrice" title="${message(code: 'listing.soldPrice.label', default: 'Sold Price')}" />
                            
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${listingInstanceList}" status="i" var="listingInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${listingInstance.id}">${fieldValue(bean: listingInstance, field: "id")}</g:link></td>
                        
                             <td>${fieldValue(bean: listingInstance, field: "mlsNumber")}</td>
			   			                           <td>${fieldValue(bean: listingInstance, field: "streetAddress")}</td>
			   			                               <td>${fieldValue(bean: listingInstance, field: "city")}</td>
			   			                               <td>${fieldValue(bean: listingInstance, field: "zip")}</td>
			   			   			<td>${listingInstance.closedDate?.format("yyyy-MM-dd")}</td>
			   			                            
			   			                           
			                               <td>${fieldValue(bean: listingInstance, field: "soldPrice")}</td>
                            
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        
        </div>
    </body>
</html>
