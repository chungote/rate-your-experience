<%@ page import="participant.Broker" %>
<%@ page import="org.ronintech.StringUtil" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'broker.label', default: 'Broker')}"/>
  <title><g:message code="default.show.label" args="[entityName]"/></title>
  <resource:rating skin="rating-small"/>
  <resource:tabView skin="default"/>
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'tabView.css')}"/>

</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
  <span class="menuButton"><g:link class="list" action="list">Back to Results</g:link></span>

</div>
<div class="body">
  <table class="summary">
  	<tr class="summary">
  	<td class="value"> <h1>Broker Activity - ${fieldValue(bean: brokerInstance, field: "companyName")}</h1>
</td>
		<td class="value"><div id="star_agent"><richui:rating dynamic="false" rating="${brokerInstance?.agentRatingAverage}" showCurrent="false" units="5" imageWidth="15"/>Agent Average Rating</div>
</td>
		<td class="value"><div id="start_exp">     <richui:rating dynamic="false" rating="${brokerInstance?.experienceRatingAverage}" showCurrent="false" units="5" imageWidth="15"/>Experience Average Rating</div>
  </td>
  		
	</tr>
 </table>
  
 	        
        
  <div class="dialog">
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
                <td>${fieldValue(bean: brokerInstance, field: "streetAddress1")}<br/>
                 ${StringUtil.properCase(brokerInstance.city)},
                  ${fieldValue(bean: brokerInstance, field: "stateOrProvince")}&nbsp;&nbsp;
                  ${fieldValue(bean: brokerInstance, field: "zip")}</td>
                   <td class="value">${fieldValue(bean: brokerInstance, field: "listingCount")}</td>
		 <td>${fieldValue(bean: brokerInstance, field: "notificationCount")}</td>
		<td>${fieldValue(bean: brokerInstance, field: "surveyRequestCount")}</td>
				                  <td valign="top" class="value">${fieldValue(bean: brokerInstance, field: "surveyResponseCount")}</td>


              </tr>
         
	</tbody>
      </table>
    </div>

<br/>
    <richui:tabView id="tabView">
      <richui:tabLabels>
        <richui:tabLabel selected="true" title="Sold Listings"/>
        <richui:tabLabel title="My Agents"/>
        <richui:tabLabel title="Survey Requests"/>
        <richui:tabLabel title="Survey Responses"/>
      </richui:tabLabels>
      <richui:tabContents>

        <richui:tabContent>
          <g:render template="listing" model="[listingInstanceList:listingInstanceList]"/>
        </richui:tabContent>

        <richui:tabContent>
          <g:render template="agent" model="[agentInstanceList:agentInstanceList]"/>
        </richui:tabContent>

        <richui:tabContent>
          <g:render template="surveyInvitationRequest"
                  model="[surveyInvitationRequestInstanceList:surveyInvitationRequestInstanceList]"/>
        </richui:tabContent>

        <richui:tabContent>
          <g:render template="surveyResponseReport"
                  model="[surveyResponseInstanceList:surveyResponseInstanceList]"/>
        </richui:tabContent>

      </richui:tabContents>
    </richui:tabView>
  </div>
  <div class="buttons">
    <g:form>
      <g:hiddenField name="id" value="${brokerInstance?.id}"/>

    </g:form>
  </div>
</div>
</body>
</html>
