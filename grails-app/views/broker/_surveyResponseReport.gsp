<%@ page import="survey.SurveyResponse" %>
<%@ page import="org.ronintech.StringUtil" %>

<div class="list">
  <table>
    <thead>
    <tr>

      <g:sortableColumn property="ratingAverage" title="${message(code: 'surveyResponse.ratingAverage.label', default: 'Rating')}"/>


      <g:sortableColumn property="lastUpdated" title="${message(code: 'surveyResponse.lastUpdated.label', default: 'Last Updated')}"/>

      <g:sortableColumn property="dateCreated" title="${message(code: 'surveyResponse.dateCreated.label', default: 'Date Created')}"/>
      <th><g:message code="surveyResponse.notification.listing.mlsNumber" default="MLS Number"/></th>
      <th><g:message code="surveyResponse.notification.listing.sellingAgent.lastName" default="Selling Agent"/></th>
      <th><g:message code="surveyResponse.notification.listing.buyerAgent.lastName" default="Buyer Agent"/></th>
      <th><g:message code="surveyResponse.notification.listing.closeDate" default="Close Date"/></th>
      <th><g:message code="surveyResponse.notification.listing.streetAddress" default="Street Address"/></th>
      <th><g:message code="surveyResponse.notification.listing.city" default="City"/></th>
      <th><g:message code="surveyResponse.notification.listing.zip" default="Zip"/></th>

    </tr>
    </thead>
    <tbody>

    <g:each in="${surveyResponseInstanceList}" status="i" var="surveyResponseInstance">

      <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
        <td>
          <div class="">
            <richui:rating dynamic="false" rating="${surveyResponseInstance.experienceRatingAverage}" units="5" showCurrent="false" imageWidth="15"/>
          </div>
        </td>


        <td><g:link controller="surveyResponse" action="show" id="${surveyResponseInstance.id}"><g:formatDate date="${surveyResponseInstance.lastUpdated}"/></g:link></td>
        <td><g:link controller="surveyResponse" action="show" id="${surveyResponseInstance.id}">${surveyResponseInstance.dateCreated?.format("yyyy-MM-dd")}</g:link></td>
        <td><g:link controller="surveyResponse" action="show" id="${surveyResponseInstance.id}">${fieldValue(bean: surveyResponseInstance, field: "notification.listing.mlsNumber")}</g:link></td>
        <td><g:link controller="surveyResponse" action="show" id="${surveyResponseInstance.id}">${fieldValue(bean: surveyResponseInstance, field: "notification.listing.sellingAgent.lastName")},<br/>${fieldValue(bean: surveyResponseInstance, field: "notification.listing.sellingAgent.firstName")}</g:link></td>
        <td><g:link controller="surveyResponse" action="show" id="${surveyResponseInstance.id}">${fieldValue(bean: surveyResponseInstance, field: "notification.listing.buyerAgent.lastName")},<br/>${fieldValue(bean: surveyResponseInstance, field: "notification.listing.buyerAgent.firstName")}</g:link></td>
        <td><g:link controller="surveyResponse" action="show" id="${surveyResponseInstance.id}">${surveyResponseInstance.notification.listing.closedDate?.format("yyyy-MM-dd")}</g:link></td>
        <td><g:link controller="surveyResponse" action="show" id="${surveyResponseInstance.id}">${fieldValue(bean: surveyResponseInstance, field: "notification.listing.streetAddress")}</g:link></td>
        <td><g:link controller="surveyResponse" action="show" id="${surveyResponseInstance.id}">${StringUtil.properCase(surveyResponseInstance.notification.listing.city)}</g:link></td>
        <td><g:link controller="surveyResponse" action="show" id="${surveyResponseInstance.id}">${fieldValue(bean: surveyResponseInstance, field: "notification.listing.zip")}</g:link></td>

      </tr>
    </g:each>
    </tbody>
  </table>
</div>
