<%@ page import="survey.SurveyResponse" %>
<%@ page import="org.ronintech.StringUtil" %>
<div class="body">

  <div class="list">
    <table>
      <thead>
      <tr>

        <g:sortableColumn property="ratingAverage" title="${message(code: 'surveyResponse.ratingAverage.label', default: 'Rating')}"/>

        <th><g:message code="surveyResponse.survey.label" default="Survey"/></th>

        <g:sortableColumn property="lastUpdated" title="${message(code: 'surveyResponse.lastUpdated.label', default: 'Last Updated')}"/>

        <g:sortableColumn property="dateCreated" title="${message(code: 'surveyResponse.dateCreated.label', default: 'Date Created')}"/>
        <th><g:message code="surveyResponse.notification.listing.closeDate" default="Close Date"/></th>
        <th><g:message code="surveyResponse.notification.listing.streetAddress" default="Street Address"/></th>
        <th><g:message code="surveyResponse.notification.listing.city" default="City"/></th>
        <th><g:message code="surveyResponse.notification.listing.zip" default="Zip"/></th>

      </tr>
      </thead>
      <tbody>
      <% def start = 0 %>

      <g:each in="${surveyResponseInstanceList}" status="i" var="surveyResponseInstance">

        <tr class="${(start % 2) == 0 ? 'odd' : 'even'}">
          <td>
            <div id="star_div_2">
              <richui:rating dynamic="false" rating="${surveyResponseInstance.experienceRatingAverage}" units="5" showCurrent="false" imageWidth="15"/>
            </div>
          </td>
          <td><g:link controller="surveyResponse" action="show" id="${surveyResponseInstance.id}">${fieldValue(bean: surveyResponseInstance, field: "id")}</g:link></td>
          <td><g:link controller="surveyResponse" action="show" id="${surveyResponseInstance.id}">${fieldValue(bean: surveyResponseInstance, field: "lastUpdated")}</g:link></td>
          <td><g:link controller="surveyResponse" action="show" id="${surveyResponseInstance.id}">${surveyResponseInstance.dateCreated?.format("yyyy-MM-dd")}</g:link></td>
          <td><g:link controller="surveyResponse" action="show" id="${surveyResponseInstance.id}">${surveyResponseInstance.notification.listing.closedDate?.format("yyyy-MM-dd")}</g:link></td>
          <td><g:link controller="surveyResponse" action="show" id="${surveyResponseInstance.id}">${fieldValue(bean: surveyResponseInstance, field: "notification.listing.streetAddress")}</g:link></td>
          <td><g:link controller="surveyResponse" action="show" id="${surveyResponseInstance.id}">${StringUtil.properCase(surveyResponseInstance.notification.listing.city)}</g:link></td>
          <td><g:link controller="surveyResponse" action="show" id="${surveyResponseInstance.id}">${fieldValue(bean: surveyResponseInstance, field: "notification.listing.zip")}</g:link></td>

        </tr>
      </g:each>
      </tbody>
    </table>
  </div>

</div>
