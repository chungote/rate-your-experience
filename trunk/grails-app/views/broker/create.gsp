<%@ page import="participant.Broker" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'broker.label', default: 'Broker')}"/>
  <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
  <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></span>
</div>
<div class="body">
  <h1><g:message code="default.create.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${brokerInstance}">
    <div class="errors">
      <g:renderErrors bean="${brokerInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form action="save" method="post">
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="mlsOfficeId"><g:message code="broker.mlsOfficeId.label" default="Mls Office Id"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'mlsOfficeId', 'errors')}">
            <g:textField name="mlsOfficeId" maxlength="25" size="25" value="${brokerInstance?.mlsOfficeId}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="mlsMainOfficeId"><g:message code="broker.mlsMainOfficeId.label" default="Mls Main Office Id"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'mlsMainOfficeId', 'errors')}">
            <g:textField name="mlsMainOfficeId" maxlength="25" size="25" value="${brokerInstance?.mlsMainOfficeId}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="mlsBrokerId"><g:message code="broker.mlsBrokerId.label" default="Mls Broker Id"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'mlsBrokerId', 'errors')}">
            <g:textField name="mlsBrokerId" maxlength="25" size="25" value="${brokerInstance?.mlsBrokerId}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="mlsStatus"><g:message code="broker.mlsStatus.label" default="Mls Status"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'mlsStatus', 'errors')}">
            <g:textField name="mlsStatus" maxlength="25" size="25" value="${brokerInstance?.mlsStatus}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="firstName"><g:message code="broker.firstName.label" default="First Name"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'firstName', 'errors')}">
            <g:textField name="firstName" maxlength="50" size="50" value="${brokerInstance?.firstName}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="lastName"><g:message code="broker.lastName.label" default="Last Name"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'lastName', 'errors')}">
            <g:textField name="lastName" maxlength="50" size="50" value="${brokerInstance?.lastName}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="middleName"><g:message code="broker.middleName.label" default="Middle Name"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'middleName', 'errors')}">
            <g:textField name="middleName" maxlength="50" size="50" value="${brokerInstance?.middleName}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="suffix"><g:message code="broker.suffix.label" default="Suffix"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'suffix', 'errors')}">
            <g:textField name="suffix" maxlength="20" size="20" value="${brokerInstance?.suffix}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="title"><g:message code="broker.title.label" default="Title"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'title', 'errors')}">
            <g:textField name="title" maxlength="50" size="50" value="${brokerInstance?.title}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="companyName"><g:message code="broker.companyName.label" default="Company Name"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'companyName', 'errors')}">
            <g:textField name="companyName" maxlength="100" size="100" value="${brokerInstance?.companyName}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="type"><g:message code="broker.type.label" default="Type"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'type', 'errors')}">
            <g:select name="type" from="${brokerInstance.constraints.type.inList}" value="${brokerInstance?.type}" valueMessagePrefix="broker.type"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="streetAddress1"><g:message code="broker.streetAddress1.label" default="Street Address1"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'streetAddress1', 'errors')}">
            <g:textField name="streetAddress1" maxlength="150" size="100" value="${brokerInstance?.streetAddress1}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="streetAddress2"><g:message code="broker.streetAddress2.label" default="Street Address2"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'streetAddress2', 'errors')}">
            <g:textField name="streetAddress2" maxlength="150" size="100" value="${brokerInstance?.streetAddress2}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="streetAddress3"><g:message code="broker.streetAddress3.label" default="Street Address3"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'streetAddress3', 'errors')}">
            <g:textField name="streetAddress3" maxlength="150" size="100" value="${brokerInstance?.streetAddress3}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="city"><g:message code="broker.city.label" default="City"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'city', 'errors')}">
            <g:textField name="city" maxlength="100" size="100" value="${brokerInstance?.city}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="stateOrProvince"><g:message code="broker.stateOrProvince.label" default="State Or Province"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'stateOrProvince', 'errors')}">
            <g:textField name="stateOrProvince" maxlength="50" size="50" value="${brokerInstance?.stateOrProvince}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="zip"><g:message code="broker.zip.label" default="Zip"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'zip', 'errors')}">
            <g:textField name="zip" maxlength="20" size="20" value="${brokerInstance?.zip}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="officePhone"><g:message code="broker.officePhone.label" default="Office Phone"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'officePhone', 'errors')}">
            <g:textField name="officePhone" maxlength="20" size="20" value="${brokerInstance?.officePhone}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="cellPhone"><g:message code="broker.cellPhone.label" default="Cell Phone"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'cellPhone', 'errors')}">
            <g:textField name="cellPhone" maxlength="20" size="20" value="${brokerInstance?.cellPhone}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="preferredPhone"><g:message code="broker.preferredPhone.label" default="Preferred Phone"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'preferredPhone', 'errors')}">
            <g:textField name="preferredPhone" maxlength="20" size="20" value="${brokerInstance?.preferredPhone}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="fax"><g:message code="broker.fax.label" default="Fax"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'fax', 'errors')}">
            <g:textField name="fax" maxlength="20" size="20" value="${brokerInstance?.fax}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="email"><g:message code="broker.email.label" default="Email"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'email', 'errors')}">
            <g:textField name="email" maxlength="200" size="100" value="${brokerInstance?.email}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="webPage"><g:message code="broker.webPage.label" default="Web Page"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'webPage', 'errors')}">
            <g:textArea name="webPage" cols="40" rows="5" value="${brokerInstance?.webPage}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="optIn"><g:message code="broker.optIn.label" default="Opt In"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'optIn', 'errors')}">
            <g:checkBox name="optIn" value="${brokerInstance?.optIn}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="enabled"><g:message code="broker.enabled.label" default="Enabled"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'enabled', 'errors')}">
            <g:checkBox name="enabled" value="${brokerInstance?.enabled}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="lastModifiedBy"><g:message code="broker.lastModifiedBy.label" default="Last Modified By"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'lastModifiedBy', 'errors')}">
            <g:textField name="lastModifiedBy" value="${brokerInstance?.lastModifiedBy}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="agents"><g:message code="broker.agents.label" default="Agents"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'agents', 'errors')}">

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="offices"><g:message code="broker.offices.label" default="Offices"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: brokerInstance, field: 'offices', 'errors')}">

          </td>
        </tr>

        </tbody>
      </table>
    </div>
    <div class="buttons">
      <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}"/></span>
    </div>
  </g:form>
</div>
</body>
</html>
