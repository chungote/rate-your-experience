<%@ page import="survey.SurveyResponse" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'surveyResponse.label', default: 'SurveyResponse')}"/>
  <title><g:message code="default.list.label" args="[entityName]"/></title>
  <resource:rating skin="rating-small"/>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>

</div>
<div class="body">
  <div>
    <table class="summary">
      <tbody>
      <tr class="summary">
        <td class="name">Survey Responses for Broker:</td>
        <td class="value">${fieldValue(bean: brokerInstance, field: "companyName")}</td>
      </tr>
      <tr class="summary">
        <td class="name">Address:</td>
        <td class="value">${fieldValue(bean: brokerInstance, field: "streetAddress1")}<br/>
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

        <g:sortableColumn property="ratingAverage" title="${message(code: 'surveyResponse.ratingAverage.label', default: 'Rating')}"/>

        <th><g:message code="surveyResponse.survey.label" default="Survey"/></th>

        <g:sortableColumn property="lastUpdated" title="${message(code: 'surveyResponse.lastUpdated.label', default: 'Last Updated')}"/>

        <g:sortableColumn property="dateCreated" title="${message(code: 'surveyResponse.dateCreated.label', default: 'Date Created')}"/>
        <g:sortableColumn property="mlsNumber" title="${message(code: 'listing.mlsNumber.label', default: 'MLS Number')}"/>
        <g:sortableColumn property="sellingAgent.lastName" title="${message(code: 'listing.sellingAgentMlsId.label', default: 'Selling Agent')}"/>
        <g:sortableColumn property="buyerAgent.lastName" title="${message(code: 'listing.buyerAgentMlsId.label', default: 'Buyer Agent')}"/>
        <g:sortableColumn property="closeDate" title="${message(code: 'listing.closeDate.label', default: 'Close Date')}"/>
        <g:sortableColumn property="streetAddress" title="${message(code: 'listing.streetAddress.label', default: 'Street Address')}"/>
        <g:sortableColumn property="city" title="${message(code: 'listing.city.label', default: 'City')}"/>
        <g:sortableColumn property="zip" title="${message(code: 'listing.zip.label', default: 'Zip')}"/>

      </tr>
      </thead>
      <tbody>
      <% def start = 0 %>
      <g:each in="${listingInstanceList}" status="i" var="listingInstance">

        <g:each in="${listingInstance.responses}" status="j" var="surveyResponseInstance">
          <%
            if (j == 0) {
              start = start + 1
            }
          %>
          <tr class="${(start % 2) == 0 ? 'odd' : 'even'}">
            <td>
              <div class="sResponse">
                <richui:rating dynamic="false" rating="${surveyResponseInstance.ratingAverage}" units="5" showCurrent="true" imageWidth="15"/>
              </div>
            </td>
            <td><g:link action="show" id="${surveyResponseInstance.id}">${fieldValue(bean: surveyResponseInstance, field: "id")}</g:link></td>

            <td><g:formatDate date="${surveyResponseInstance.lastUpdated}"/></td>

            <td>${surveyResponseInstance.dateCreated?.format("yyyy-MM-dd")}</td>
            <td>${fieldValue(bean: listingInstance, field: "mlsNumber")} /></td>
            <td><g:link controller="agent" action="show" id="${sellingAgentMlsId}">${fieldValue(bean: listingInstance, field: "sellingAgent.firstName")}&nbsp;${fieldValue(bean: listingInstance, field: "sellingAgent.lastName")}</g:link></td>
            <td><g:link controller="agent" action="show" id="${buyerAgentMlsId}">${fieldValue(bean: listingInstance, field: "buyerAgent.firstName")}&nbsp;${fieldValue(bean: listingInstance, field: "buyerAgent.lastName")}</g:link></td>
            <td>${listingInstance.closeDate?.format("yyyy-MM-dd")}</td>
            <td>${fieldValue(bean: listingInstance, field: "streetAddress")} /></td>
            <td>${fieldValue(bean: listingInstance, field: "city")} /></td>
            <td>${fieldValue(bean: listingInstance, field: "zip")} /></td>

          </tr>
        </g:each>
      </g:each>
      </tbody>
    </table>
  </div>

</div>
</body>
</html>
