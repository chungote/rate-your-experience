<%@ page import="participant.Broker" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'broker.label', default: 'Broker')}"/>
  <title><g:message code="default.edit.label" args="[entityName]"/></title>
  <resource:autoComplete skin="default"/>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
  <span class="menuButton"><g:link class="list" action="editList">Back to list</g:link></span>
  
</div>
<div class="body">
  <h1>Edit Broker Options</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${brokerInstance}">
    <div class="errors">
      <g:renderErrors bean="${brokerInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form method="post">
    <g:hiddenField name="id" value="${brokerInstance?.id}"/>
    <g:hiddenField name="version" value="${brokerInstance?.version}"/>
    <div class="dialog">
      <table>
        <tbody>

       
        <tr class="prop">
          <td valign="top" class="name">
            <label for="companyName"><g:message code="broker.companyName.label" default="Company Name"/></label>
          </td>
          <td valign="top" class="value">
           <g:fieldValue bean="${brokerInstance}" field="companyName"/>
          </td>
        </tr>

       
        <tr class="prop">
          <td valign="top" class="name">
            <label for="optIn"><g:message code="broker.optIn.label" default="Opt In Ratings"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'optInRatings', 'errors')}">
            <g:checkBox name="optInRatings" value="${brokerInstance?.optInRatings}"/>
          </td>
        </tr>
        <tr class="prop">
	          <td valign="top" class="name">
	            <label for="optIn"><g:message code="broker.optIn.label" default="Opt In Public Display"/></label>
	          </td>
	          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'optInPublicDisplay', 'errors')}">
	            <g:checkBox name="optInPublicDisplay" value="${brokerInstance?.optInPublicDisplay}"/>
	          </td>
        </tr>
<g:ifAnyGranted role="ROLE_ADMIN">
        <tr class="prop">
          <td valign="top" class="name">
            <label for="enabled"><g:message code="broker.enabled.label" default="Enabled"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'enabled', 'errors')}">
            <g:checkBox name="enabled" value="${brokerInstance?.enabled}"/>
          </td>
        </tr>
 </g:ifAnyGranted>
        <g:ifAnyGranted role="ROLE_BROKER">
          
        <tr class="prop">
		          <td valign="top" class="name">
				Set Centralized Responder for Information Requests
			 </td>
		          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'centralizedResponder', 'errors')}">
			          
			             <richui:autoComplete name="userRealName"
			                     minQueryLength="1"
			                     queryDelay="1"
			                     delimChar=""
			                     action="searchAJAXUsers"
			                     value="${brokerInstance?.centralizedResponder?.userRealName}"/>
          </td>
        </tr>
        </g:ifAnyGranted>
	<g:if test="${brokerInstance.termsOfServiceId!=null}">
		<tr class="prop">
			<td valign="top" class="name"><label for="termsOfServiceId">View Terms of Service Signed:</label></td>
			<td><g:link controller="termsOfService" action="show" id="${brokerInstance.termsOfServiceId}">View TOS</g:link></td>
		</tr>
	</g:if>
        
        </tbody>
      </table>
    </div>
    <div class="buttons">
      <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>
  
    </div>
  </g:form>
</div>
</body>
</html>
