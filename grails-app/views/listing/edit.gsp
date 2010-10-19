<%@ page import="transaction.Listing" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'listing.label', default: 'Listing')}"/>
  <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
  <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></span>
  <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></span>
</div>
<div class="body">
  <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${listingInstance}">
    <div class="errors">
      <g:renderErrors bean="${listingInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form method="post">
    <g:hiddenField name="id" value="${listingInstance?.id}"/>
    <g:hiddenField name="version" value="${listingInstance?.version}"/>
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="mlsNumber"><g:message code="listing.mlsNumber.label" default="Mls Number"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'mlsNumber', 'errors')}">
            <g:textField name="mlsNumber" maxlength="20" size="20" value="${listingInstance?.mlsNumber}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="listDate"><g:message code="listing.listDate.label" default="List Date"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'listDate', 'errors')}">
            <g:datePicker name="listDate" precision="day" value="${listingInstance?.listDate}" noSelection="['': '']"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="closedDate"><g:message code="listing.closedDate.label" default="Closed Date"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'closedDate', 'errors')}">
            <g:datePicker name="closedDate" precision="day" value="${listingInstance?.closedDate}" noSelection="['': '']"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="listPrice"><g:message code="listing.listPrice.label" default="List Price"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'listPrice', 'errors')}">
            <g:textField name="listPrice" value="${fieldValue(bean: listingInstance, field: 'listPrice')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="soldPrice"><g:message code="listing.soldPrice.label" default="Sold Price"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'soldPrice', 'errors')}">
            <g:textField name="soldPrice" value="${fieldValue(bean: listingInstance, field: 'soldPrice')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="streetAddress"><g:message code="listing.streetAddress.label" default="Street Address"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'streetAddress', 'errors')}">
            <g:textField name="streetAddress" maxlength="100" size="100" value="${listingInstance?.streetAddress}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="unitNumber"><g:message code="listing.unitNumber.label" default="Unit Number"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'unitNumber', 'errors')}">
            <g:textField name="unitNumber" maxlength="20" size="20" value="${listingInstance?.unitNumber}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="lotNumber"><g:message code="listing.lotNumber.label" default="Lot Number"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'lotNumber', 'errors')}">
            <g:textField name="lotNumber" maxlength="20" size="20" value="${listingInstance?.lotNumber}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="city"><g:message code="listing.city.label" default="City"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'city', 'errors')}">
            <g:textField name="city" maxlength="100" size="100" value="${listingInstance?.city}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="zip"><g:message code="listing.zip.label" default="Zip"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'zip', 'errors')}">
            <g:textField name="zip" maxlength="20" size="20" value="${listingInstance?.zip}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="stateOrProvince"><g:message code="listing.stateOrProvince.label" default="State Or Province"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'stateOrProvince', 'errors')}">
            <g:textField name="stateOrProvince" maxlength="50" size="50" value="${listingInstance?.stateOrProvince}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="county"><g:message code="listing.county.label" default="County"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'county', 'errors')}">
            <g:textField name="county" maxlength="100" size="100" value="${listingInstance?.county}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="area"><g:message code="listing.area.label" default="Area"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'area', 'errors')}">
            <g:textField name="area" maxlength="100" size="100" value="${listingInstance?.area}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="listingAgentMlsId"><g:message code="listing.listingAgentMlsId.label" default="Listing Agent Mls Id"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'listingAgentMlsId', 'errors')}">
            <g:textField name="listingAgentMlsId" maxlength="25" size="25" value="${listingInstance?.listingAgentMlsId}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="listingOfficeMlsId"><g:message code="listing.listingOfficeMlsId.label" default="Listing Office Mls Id"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'listingOfficeMlsId', 'errors')}">
            <g:textField name="listingOfficeMlsId" maxlength="25" size="25" value="${listingInstance?.listingOfficeMlsId}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="sellingAgentMlsId"><g:message code="listing.sellingAgentMlsId.label" default="Selling Agent Mls Id"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'sellingAgentMlsId', 'errors')}">
            <g:textField name="sellingAgentMlsId" maxlength="25" size="25" value="${listingInstance?.sellingAgentMlsId}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="sellingOfficeMlsId"><g:message code="listing.sellingOfficeMlsId.label" default="Selling Office Mls Id"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'sellingOfficeMlsId', 'errors')}">
            <g:textField name="sellingOfficeMlsId" maxlength="25" size="25" value="${listingInstance?.sellingOfficeMlsId}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="buyerAgentMlsId"><g:message code="listing.buyerAgentMlsId.label" default="Buyer Agent Mls Id"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'buyerAgentMlsId', 'errors')}">
            <g:textField name="buyerAgentMlsId" maxlength="25" size="25" value="${listingInstance?.buyerAgentMlsId}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="buyerOfficeMlsId"><g:message code="listing.buyerOfficeMlsId.label" default="Buyer Office Mls Id"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'buyerOfficeMlsId', 'errors')}">
            <g:textField name="buyerOfficeMlsId" maxlength="25" size="25" value="${listingInstance?.buyerOfficeMlsId}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="beds"><g:message code="listing.beds.label" default="Beds"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'beds', 'errors')}">
            <g:textField name="beds" value="${fieldValue(bean: listingInstance, field: 'beds')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="bathsFull"><g:message code="listing.bathsFull.label" default="Baths Full"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'bathsFull', 'errors')}">
            <g:textField name="bathsFull" value="${fieldValue(bean: listingInstance, field: 'bathsFull')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="bathsHalf"><g:message code="listing.bathsHalf.label" default="Baths Half"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'bathsHalf', 'errors')}">
            <g:textField name="bathsHalf" value="${fieldValue(bean: listingInstance, field: 'bathsHalf')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="bathsTotal"><g:message code="listing.bathsTotal.label" default="Baths Total"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'bathsTotal', 'errors')}">
            <g:textField name="bathsTotal" value="${fieldValue(bean: listingInstance, field: 'bathsTotal')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="rooms"><g:message code="listing.rooms.label" default="Rooms"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'rooms', 'errors')}">
            <g:textField name="rooms" value="${fieldValue(bean: listingInstance, field: 'rooms')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="yearBuilt"><g:message code="listing.yearBuilt.label" default="Year Built"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'yearBuilt', 'errors')}">
            <g:textField name="yearBuilt" value="${listingInstance?.yearBuilt}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="style"><g:message code="listing.style.label" default="Style"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'style', 'errors')}">
            <g:textField name="style" maxlength="200" size="100" value="${listingInstance?.style}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="schoolDistrict"><g:message code="listing.schoolDistrict.label" default="School District"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'schoolDistrict', 'errors')}">
            <g:textField name="schoolDistrict" maxlength="100" size="100" value="${listingInstance?.schoolDistrict}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="propertyType"><g:message code="listing.propertyType.label" default="Property Type"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'propertyType', 'errors')}">
            <g:textField name="propertyType" maxlength="100" size="100" value="${listingInstance?.propertyType}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="propertySubType"><g:message code="listing.propertySubType.label" default="Property Sub Type"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'propertySubType', 'errors')}">
            <g:textField name="propertySubType" maxlength="100" size="100" value="${listingInstance?.propertySubType}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="acres"><g:message code="listing.acres.label" default="Acres"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'acres', 'errors')}">
            <g:textField name="acres" maxlength="20" size="20" value="${listingInstance?.acres}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="lotSize"><g:message code="listing.lotSize.label" default="Lot Size"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'lotSize', 'errors')}">
            <g:textField name="lotSize" maxlength="25" size="25" value="${listingInstance?.lotSize}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="squareFeet"><g:message code="listing.squareFeet.label" default="Square Feet"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'squareFeet', 'errors')}">
            <g:textField name="squareFeet" maxlength="25" size="25" value="${listingInstance?.squareFeet}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="subdivision"><g:message code="listing.subdivision.label" default="Subdivision"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'subdivision', 'errors')}">
            <g:textField name="subdivision" maxlength="100" size="100" value="${listingInstance?.subdivision}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="buyerAgent"><g:message code="listing.buyerAgent.label" default="Buyer Agent"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'buyerAgent', 'errors')}">

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="buyerBroker"><g:message code="listing.buyerBroker.label" default="Buyer Broker"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'buyerBroker', 'errors')}">

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="buyerOffice"><g:message code="listing.buyerOffice.label" default="Buyer Office"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'buyerOffice', 'errors')}">

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="listingAgent"><g:message code="listing.listingAgent.label" default="Listing Agent"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'listingAgent', 'errors')}">

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="listingOffice"><g:message code="listing.listingOffice.label" default="Listing Office"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'listingOffice', 'errors')}">

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="sellingAgent"><g:message code="listing.sellingAgent.label" default="Selling Agent"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'sellingAgent', 'errors')}">

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="sellingBroker"><g:message code="listing.sellingBroker.label" default="Selling Broker"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'sellingBroker', 'errors')}">

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="sellingOffice"><g:message code="listing.sellingOffice.label" default="Selling Office"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'sellingOffice', 'errors')}">

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="transaction"><g:message code="listing.transaction.label" default="Transaction"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: listingInstance, field: 'transaction', 'errors')}">

          </td>
        </tr>

        </tbody>
      </table>
    </div>
    <div class="buttons">
      <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>
      <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
    </div>
  </g:form>
</div>
</body>
</html>
