<%@ page import="participant.ServiceProvider" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'serviceProvider.label', default: 'ServiceProvider')}"/>
  <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
  <span class="menuButton"><g:link class="list" action="list">Back to Search</g:link></span>
  <span class="menuButton"><g:link class="create" action="create">Create New Service Provider</g:link></span>
</div>
<div class="body">
  <h1>Edit Service Provider</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${serviceProviderInstance}">
    <div class="errors">
      <g:renderErrors bean="${serviceProviderInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form method="post">
    <g:hiddenField name="id" value="${serviceProviderInstance?.id}"/>
    <g:hiddenField name="version" value="${serviceProviderInstance?.version}"/>
    <g:hiddenField name="optIn" value="true"/>
    <g:hiddenField name="enabled" value="true"/>
    <g:hiddenField name="lastModifiedBy" value="${person}"/>
    <div class="dialog">
      <table>
        <tbody>
<g:ifAnyGranted role="ROLE_AGENT,ROLE_ADMIN,ROLE_BROKER">
        <tr class="prop">
          <td valign="top" class="name">
            <label for="type"><g:message code="serviceProvider.type.label" default="Type"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: serviceProviderInstance, field: 'type', 'errors')}">
            <g:select name="type" from="${serviceProviderInstance.constraints.type.inList}" value="${serviceProviderInstance?.type}" valueMessagePrefix="serviceProvider.type"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="companyName"><g:message code="serviceProvider.companyName.label" default="Company Name"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: serviceProviderInstance, field: 'companyName', 'errors')}">
            <g:textField name="companyName" maxlength="100" size="100" value="${serviceProviderInstance?.companyName}"/>
          </td>
        </tr>
        <tr class="prop">
          <td valign="top" class="name">
            <label for="email"><g:message code="serviceProvider.email.label" default="Email"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: serviceProviderInstance, field: 'email', 'errors')}">
            <g:textField name="email" maxlength="200" size="100" value="${serviceProviderInstance?.email}"/>
          </td>
        </tr>


        <tr class="prop">
          <td valign="top" class="name">
            <label for="streetAddress1"><g:message code="serviceProvider.streetAddress1.label" default="Street Address1"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: serviceProviderInstance, field: 'streetAddress1', 'errors')}">
            <g:textField name="streetAddress1" maxlength="150" size="100" value="${serviceProviderInstance?.streetAddress1}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="streetAddress2"><g:message code="serviceProvider.streetAddress2.label" default="Street Address2"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: serviceProviderInstance, field: 'streetAddress2', 'errors')}">
            <g:textField name="streetAddress2" maxlength="150" size="100" value="${serviceProviderInstance?.streetAddress2}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="streetAddress3"><g:message code="serviceProvider.streetAddress3.label" default="Street Address3"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: serviceProviderInstance, field: 'streetAddress3', 'errors')}">
            <g:textField name="streetAddress3" maxlength="150" size="100" value="${serviceProviderInstance?.streetAddress3}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="city"><g:message code="serviceProvider.city.label" default="City"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: serviceProviderInstance, field: 'city', 'errors')}">
            <g:textField name="city" maxlength="100" size="100" value="${serviceProviderInstance?.city}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="stateOrProvince"><g:message code="serviceProvider.stateOrProvince.label" default="State Or Province"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: serviceProviderInstance, field: 'stateOrProvince', 'errors')}">
            <g:textField name="stateOrProvince" maxlength="50" size="50" value="${serviceProviderInstance?.stateOrProvince}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="zip"><g:message code="serviceProvider.zip.label" default="Zip"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: serviceProviderInstance, field: 'zip', 'errors')}">
            <g:textField name="zip" maxlength="20" size="20" value="${serviceProviderInstance?.zip}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="officePhone"><g:message code="serviceProvider.officePhone.label" default="Office Phone"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: serviceProviderInstance, field: 'officePhone', 'errors')}">
            <g:textField name="officePhone" maxlength="20" size="20" value="${serviceProviderInstance?.officePhone}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="cellPhone"><g:message code="serviceProvider.cellPhone.label" default="Cell Phone"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: serviceProviderInstance, field: 'cellPhone', 'errors')}">
            <g:textField name="cellPhone" maxlength="20" size="20" value="${serviceProviderInstance?.cellPhone}"/>
          </td>
        </tr>


        <tr class="prop">
          <td valign="top" class="name">
            <label for="fax"><g:message code="serviceProvider.fax.label" default="Fax"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: serviceProviderInstance, field: 'fax', 'errors')}">
            <g:textField name="fax" maxlength="20" size="20" value="${serviceProviderInstance?.fax}"/>
          </td>
        </tr>
</g:ifAnyGranted>
<g:ifAnyGranted role="ROLE_PROVIDER">
 <tr class="prop">
          <td valign="top" class="name">
            <label for="optInRatings"><g:message code="serviceProvider.optInRatings.label" default="Opt In Ratings"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: serviceProviderInstance, field: 'optInRatings', 'errors')}">
            <g:checkBox name="optInRatings" value="${serviceProviderInstance?.optInRatings}"/>
          </td>
        </tr>
        <tr class="prop">
	          <td valign="top" class="name">
	            <label for="optInPublicDisplay"><g:message code="serviceProvider.optInPublicDisplay.label" default="Opt In Public Display"/></label>
	          </td>
	          <td valign="top" class="value ${hasErrors(bean: serviceProviderInstance, field: 'optInPublicDisplay', 'errors')}">
	            <g:checkBox name="optInPublicDisplay" value="${serviceProviderInstance?.optInPublicDisplay}"/>
	          </td>
        </tr>
       
</g:ifAnyGranted>


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
