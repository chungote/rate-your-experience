<%@ page import="participant.Agent" %>
<%@ page import="org.ronintech.StringUtil" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'agent.label', default: 'Agent')}"/>
  <title><g:message code="default.show.label" args="[entityName]"/></title>
  <resource:rating skin="rating-small"/>
  <resource:tabView skin="default"/>
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'tabView.css')}"/>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
  <span class="menuButton"><g:link controller="broker" class="list" action="show" id="${agentInstance.broker.id}">Back to Results</g:link></span>

</div>
<div class="body">
  <table class="summary">
  	<tr class="summary">
  	<td class="value"> <h1>Agent Activity - ${fieldValue(bean: agentInstance, field: "firstName")}&nbsp; ${fieldValue(bean: agentInstance, field: "lastName")} - ${fieldValue(bean: agentInstance, field: "companyName")}</h1>
</td>
		<td class="value"><div id="star_agent"><richui:rating dynamic="false" rating="${agentInstance?.ratingAverage}" showCurrent="false" units="5" imageWidth="15"/>Agent Average Rating</div>
</td>
		<td class="value"><div id="start_exp">     <richui:rating dynamic="false" rating="${agentInstance?.experienceRatingAverage}" showCurrent="false" units="5" imageWidth="15"/>Experience Average Rating</div>
  </td>
  		
	</tr>
 </table>
  <div>
    <table>
              <tbody>
              <tr>
              <th>Address</th>
              <th>Total Sold Listings</th>
              <th>Total Notifications</th>
              <th>Total Survey Requests Sent</th>
              <th>Total Survey Responses</th>
              </tr>
              <tr>
		<td>${fieldValue(bean: agentInstance, field: "streetAddress1")}<br/>
	       ${StringUtil.properCase(agentInstance.city)},
	       ${fieldValue(bean: agentInstance, field: "stateOrProvince")}&nbsp;&nbsp;
	       ${fieldValue(bean: agentInstance, field: "zip")}</td>
		  <td>${fieldValue(bean: agentInstance, field: "listingTotal")}</td>
		  <td>${fieldValue(bean: agentInstance, field: "notificationsTotal")}</td>
				  <td>${fieldValue(bean: agentInstance, field: "surveyRequestTotal")}</td>
				  <td valign="top">${fieldValue(bean: agentInstance, field: "surveyResponseTotal")}</td>

     
                   </tr>
         
     </table>
      
  </div>
  <br/>
  <div class="dialog">
    <richui:tabView id="tabView">
      <richui:tabLabels>
        <richui:tabLabel selected="true" title="Sold Listings"/>
        <richui:tabLabel title="Survey Requests"/>
        <richui:tabLabel title="Survey Responses"/>
      </richui:tabLabels>
      <richui:tabContents>
        <richui:tabContent>

          <g:render template="listing" model="[listingInstanceList:listingInstanceList]"/>

        </richui:tabContent>

        <richui:tabContent>
          <g:render template="surveyInvitationRequest" model="[surveyInvitationRequestInstanceList:surveyInvitationRequestInstanceList]"/>

        </richui:tabContent>
        <richui:tabContent>
          <g:render template="surveyResponseReport" model="[surveyResponseInstanceList:surveyResponseInstanceList]"/>

        </richui:tabContent>
      </richui:tabContents>
    </richui:tabView>
  </div>
  <div class="buttons">
    <g:form>
      <g:hiddenField name="id" value="${agentInstance?.id}"/>
      <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>

    </g:form>
  </div>
</div>
</body>
</html>
