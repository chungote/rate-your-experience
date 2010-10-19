<%@ page import="participant.Agent" %>
<div class="list">
  <table>
    <thead>
    <tr>

      <g:sortableColumn property="ratingAverage" title="${message(code: 'agent.ratingAverage.label', default: 'Average Rating')}"/>

      <g:sortableColumn property="lastName" title="${message(code: 'agent.lastName.label', default: 'Name')}"/>

      <g:sortableColumn property="companyName" title="${message(code: 'agent.companyName.label', default: 'Company Name')}"/>

      <g:sortableColumn property="streetAddress1" title="${message(code: 'agent.streetAddress1.label', default: 'Address')}"/>

      <g:sortableColumn property="city" title="${message(code: 'agent.city.label', default: 'City')}"/>

      <g:sortableColumn property="zip" title="${message(code: 'agent.zip.label', default: 'Zip')}"/>

      <g:sortableColumn property="mlsStatus" title="${message(code: 'agent.mlsStatus.label', default: 'Mls Status')}"/>

    </tr>
    </thead>
    <tbody>
    <g:each in="${agentInstanceList}" status="i" var="agentInstance">
      <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
        <td>
          <div class="sResponse">
            <richui:rating dynamic="false" rating="${agentInstance.ratingAverage}" units="5" showCurrent="false" imageWidth="15"/>
          </div>
        </td>
        <td><g:link action="show" id="${agentInstance.id}">${fieldValue(bean: agentInstance, field: "lastName")},<br/>${fieldValue(bean: agentInstance, field: "firstName")}</g:link></td>

        <td>${fieldValue(bean: agentInstance, field: "companyName")}</td>

        <td>${fieldValue(bean: agentInstance, field: "streetAddress1")}</td>

        <td>${fieldValue(bean: agentInstance, field: "city")}</td>

        <td>${fieldValue(bean: agentInstance, field: "zip")}</td>

        <td>${fieldValue(bean: agentInstance, field: "mlsStatus")}</td>

      </tr>
    </g:each>
    </tbody>
  </table>
</div>
           
