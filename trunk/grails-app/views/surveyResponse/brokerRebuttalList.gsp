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
        <td class="name">Rebuttals for Broker:</td>
        <td class="value">${fieldValue(bean: brokerInstance, field: "companyName")}</td>
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
        <g:sortableColumn property="closeDate" title="${message(code: 'listing.closedDate.label', default: 'Close Date')}"/>
        <g:sortableColumn property="mlsNumber" title="${message(code: 'listing.mlsNumber.label', default: 'MLS Number')}"/>
        <g:sortableColumn property="sellingAgent.lastName" title="${message(code: 'listing.sellingAgentMlsId.label', default: 'Selling Agent')}"/>
        <th>Rebuttal</th>

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
          <g:if test="${surveyResponseInstance.rebuttal!=null}">
            <tr class="${(start % 2) == 0 ? 'odd' : 'even'}">
              <td>
                <div class="sResponse">
                  <richui:rating dynamic="false" rating="${surveyResponseInstance.ratingAverage}" units="5" showCurrent="true" imageWidth="15"/>
                </div>
              </td>
              <td><g:link action="show" id="${surveyResponseInstance.id}">${listingInstance.closedDate?.format("yyyy-MM-dd")}</g:link></td>
              <td><g:link action="show" id="${surveyResponseInstance.id}">${fieldValue(bean: listingInstance, field: "mlsNumber")}</g:link></td>
              <td><g:link action="show" id="${surveyResponseInstance.id}">${fieldValue(bean: listingInstance, field: "sellingAgent.firstName")}&nbsp;${fieldValue(bean: listingInstance, field: "sellingAgent.lastName")}</g:link></td>
              <td><g:link action="show" id="${surveyResponseInstance.id}">${fieldValue(bean: surveyResponseInstance, field: "rebuttal")}</g:link></td>

            </tr>
          </g:if>
        </g:each>
      </g:each>
      </tbody>
    </table>
  </div>

</div>
</body>
</html>
