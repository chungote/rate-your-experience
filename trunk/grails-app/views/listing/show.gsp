
<%@ page import="transaction.Listing" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'listing.label', default: 'Listing')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.mlsNumber.label" default="Mls Number" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "mlsNumber")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.listDate.label" default="List Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${listingInstance?.listDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.closedDate.label" default="Closed Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${listingInstance?.closedDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.listPrice.label" default="List Price" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "listPrice")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.soldPrice.label" default="Sold Price" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "soldPrice")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.streetAddress.label" default="Street Address" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "streetAddress")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.unitNumber.label" default="Unit Number" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "unitNumber")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.lotNumber.label" default="Lot Number" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "lotNumber")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.city.label" default="City" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "city")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.zip.label" default="Zip" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "zip")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.stateOrProvince.label" default="State Or Province" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "stateOrProvince")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.county.label" default="County" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "county")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.area.label" default="Area" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "area")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.listingAgentMlsId.label" default="Listing Agent Mls Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "listingAgentMlsId")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.listingOfficeMlsId.label" default="Listing Office Mls Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "listingOfficeMlsId")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.sellingAgentMlsId.label" default="Selling Agent Mls Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "sellingAgentMlsId")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.sellingOfficeMlsId.label" default="Selling Office Mls Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "sellingOfficeMlsId")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.buyerAgentMlsId.label" default="Buyer Agent Mls Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "buyerAgentMlsId")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.buyerOfficeMlsId.label" default="Buyer Office Mls Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "buyerOfficeMlsId")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.beds.label" default="Beds" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "beds")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.bathsFull.label" default="Baths Full" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "bathsFull")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.bathsHalf.label" default="Baths Half" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "bathsHalf")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.bathsTotal.label" default="Baths Total" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "bathsTotal")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.rooms.label" default="Rooms" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "rooms")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.yearBuilt.label" default="Year Built" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "yearBuilt")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.style.label" default="Style" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "style")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.schoolDistrict.label" default="School District" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "schoolDistrict")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.propertyType.label" default="Property Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "propertyType")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.propertySubType.label" default="Property Sub Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "propertySubType")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.acres.label" default="Acres" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "acres")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.lotSize.label" default="Lot Size" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "lotSize")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.squareFeet.label" default="Square Feet" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "squareFeet")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.subdivision.label" default="Subdivision" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "subdivision")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${listingInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${listingInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.buyerAgent.label" default="Buyer Agent" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "buyerAgent")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.buyerBroker.label" default="Buyer Broker" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "buyerBroker")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.buyerOffice.label" default="Buyer Office" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "buyerOffice")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.listingAgent.label" default="Listing Agent" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "listingAgent")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.listingOffice.label" default="Listing Office" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "listingOffice")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.sellingAgent.label" default="Selling Agent" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "sellingAgent")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.sellingBroker.label" default="Selling Broker" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "sellingBroker")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.sellingOffice.label" default="Selling Office" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "sellingOffice")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="listing.transaction.label" default="Transaction" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: listingInstance, field: "transaction")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${listingInstance?.id}" />
                   
                </g:form>
            </div>
        </div>
    </body>
</html>
