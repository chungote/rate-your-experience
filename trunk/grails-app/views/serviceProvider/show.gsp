<%@ page import="participant.ServiceProvider" %>
<%@ page import="org.ronintech.StringUtil" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'serviceProvider.label', default: 'Service Provider')}"/>
  <title><g:message code="default.show.label" args="[entityName]"/></title>
  <resource:rating skin="rating-small"/>
  <resource:tabView skin="default"/>
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'tabView.css')}"/>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>

</div>
<g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${serviceProviderInstance}">
    <div class="errors">
      <g:renderErrors bean="${serviceProviderInstance}" as="list"/>
    </div>
  </g:hasErrors>
<div class="body">
  <table class="summary">
  	<tr class="summary">
  	<td class="value"> <h1>Service Provider Activity - ${fieldValue(bean: serviceProviderInstance, field: "companyName")}</h1>
</td>
		<td class="value"><div id="star_agent"><richui:rating dynamic="false" rating="${serviceProviderInstance?.ratingAverage}" showCurrent="false" units="5" imageWidth="15"/>Average Rating</div>
</td>
	
  		
	</tr>
 </table>
  <br/>
  <div class="dialog">
    <richui:tabView id="tabView">
      <richui:tabLabels>
        <richui:tabLabel title="Survey Responses"/>
      </richui:tabLabels>
      <richui:tabContents>
        <richui:tabContent>
          <g:render template="surveyResponseReport" model="[surveyResponseInstanceList:surveyResponseInstanceList]"/>

        </richui:tabContent>
      </richui:tabContents>
    </richui:tabView>
  </div>
</div>
</body>
</html>
