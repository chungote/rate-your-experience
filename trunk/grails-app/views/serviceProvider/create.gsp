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
</div>
<div class="body">
  <h1>Create Service Provider</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${serviceProviderInstance}">
    <div class="errors">
      <g:renderErrors bean="${serviceProviderInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form method="post" action="save">
    <g:hiddenField name="optIn" value="true"/>
    <g:hiddenField name="enabled" value="true"/>
     <div class="dialog">
      <table>
        <tbody>

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
            <label for="firstName"><g:message code="serviceProvider.firstName.label" default="First Name"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: serviceProviderInstance, field: 'firstName', 'errors')}">
            <g:textField name="firstName" maxlength="50" size="50" value="${serviceProviderInstance?.firstName}"/>
          </td>
        </tr>

	 <tr class="prop">
          <td valign="top" class="name">
            <label for="middleName"><g:message code="serviceProvider.middleName.label" default="Middle Name"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: serviceProviderInstance, field: 'middleName', 'errors')}">
            <g:textField name="middleName" maxlength="50" size="50" value="${serviceProviderInstance?.middleName}"/>
          </td>
        </tr>


        <tr class="prop">
          <td valign="top" class="name">
            <label for="lastName"><g:message code="serviceProvider.lastName.label" default="Last Name"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: serviceProviderInstance, field: 'lastName', 'errors')}">
            <g:textField name="lastName" maxlength="50" size="50" value="${serviceProviderInstance?.lastName}"/>
          </td>
        </tr>
       
        <tr class="prop">
          <td valign="top" class="name">
            <label for="suffix"><g:message code="serviceProvider.suffix.label" default="Suffix"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: serviceProviderInstance, field: 'suffix', 'errors')}">
            <g:textField name="suffix" maxlength="20" size="20" value="${serviceProviderInstance?.suffix}"/>
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



        </tbody>
      </table>
    </div>
 <div class="buttons">
       <span class="button"><input class="save" type="submit" value="Create"/></span>
     </div>

  </g:form>
</div>
</body>
</html>
