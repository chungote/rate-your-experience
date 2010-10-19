<%@ page import="participant.Agent" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'agent.label', default: 'Agent')}"/>
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
  <g:hasErrors bean="${agentInstance}">
    <div class="errors">
      <g:renderErrors bean="${agentInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form action="save" method="post">
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="mlsAgentId"><g:message code="agent.mlsAgentId.label" default="Mls Agent Id"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'mlsAgentId', 'errors')}">
            <g:textField name="mlsAgentId" maxlength="25" size="25" value="${agentInstance?.mlsAgentId}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="mlsMainOfficeId"><g:message code="agent.mlsMainOfficeId.label" default="Mls Main Office Id"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'mlsMainOfficeId', 'errors')}">
            <g:textField name="mlsMainOfficeId" maxlength="25" size="25" value="${agentInstance?.mlsMainOfficeId}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="mlsOfficeId"><g:message code="agent.mlsOfficeId.label" default="Mls Office Id"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'mlsOfficeId', 'errors')}">
            <g:textField name="mlsOfficeId" maxlength="25" size="25" value="${agentInstance?.mlsOfficeId}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="nrdsId"><g:message code="agent.nrdsId.label" default="Nrds Id"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'nrdsId', 'errors')}">
            <g:textField name="nrdsId" maxlength="25" size="25" value="${agentInstance?.nrdsId}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="mlsStatus"><g:message code="agent.mlsStatus.label" default="Mls Status"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'mlsStatus', 'errors')}">
            <g:textField name="mlsStatus" maxlength="25" size="25" value="${agentInstance?.mlsStatus}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="firstName"><g:message code="agent.firstName.label" default="First Name"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'firstName', 'errors')}">
            <g:textField name="firstName" maxlength="50" size="50" value="${agentInstance?.firstName}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="lastName"><g:message code="agent.lastName.label" default="Last Name"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'lastName', 'errors')}">
            <g:textField name="lastName" maxlength="50" size="50" value="${agentInstance?.lastName}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="middleName"><g:message code="agent.middleName.label" default="Middle Name"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'middleName', 'errors')}">
            <g:textField name="middleName" maxlength="50" size="50" value="${agentInstance?.middleName}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="suffix"><g:message code="agent.suffix.label" default="Suffix"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'suffix', 'errors')}">
            <g:textField name="suffix" maxlength="20" size="20" value="${agentInstance?.suffix}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="title"><g:message code="agent.title.label" default="Title"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'title', 'errors')}">
            <g:textField name="title" maxlength="50" size="50" value="${agentInstance?.title}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="companyName"><g:message code="agent.companyName.label" default="Company Name"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'companyName', 'errors')}">
            <g:textField name="companyName" maxlength="100" size="100" value="${agentInstance?.companyName}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="type"><g:message code="agent.type.label" default="Type"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'type', 'errors')}">
            <g:select name="type" from="${agentInstance.constraints.type.inList}" value="${agentInstance?.type}" valueMessagePrefix="agent.type"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="streetAddress1"><g:message code="agent.streetAddress1.label" default="Street Address1"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'streetAddress1', 'errors')}">
            <g:textField name="streetAddress1" maxlength="150" size="100" value="${agentInstance?.streetAddress1}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="streetAddress2"><g:message code="agent.streetAddress2.label" default="Street Address2"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'streetAddress2', 'errors')}">
            <g:textField name="streetAddress2" maxlength="150" size="100" value="${agentInstance?.streetAddress2}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="streetAddress3"><g:message code="agent.streetAddress3.label" default="Street Address3"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'streetAddress3', 'errors')}">
            <g:textField name="streetAddress3" maxlength="150" size="100" value="${agentInstance?.streetAddress3}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="city"><g:message code="agent.city.label" default="City"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'city', 'errors')}">
            <g:textField name="city" maxlength="100" size="100" value="${agentInstance?.city}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="stateOrProvince"><g:message code="agent.stateOrProvince.label" default="State Or Province"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'stateOrProvince', 'errors')}">
            <g:textField name="stateOrProvince" maxlength="50" size="50" value="${agentInstance?.stateOrProvince}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="zip"><g:message code="agent.zip.label" default="Zip"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'zip', 'errors')}">
            <g:textField name="zip" maxlength="20" size="20" value="${agentInstance?.zip}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="officePhone"><g:message code="agent.officePhone.label" default="Office Phone"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'officePhone', 'errors')}">
            <g:textField name="officePhone" maxlength="20" size="20" value="${agentInstance?.officePhone}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="cellPhone"><g:message code="agent.cellPhone.label" default="Cell Phone"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'cellPhone', 'errors')}">
            <g:textField name="cellPhone" maxlength="20" size="20" value="${agentInstance?.cellPhone}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="preferredPhone"><g:message code="agent.preferredPhone.label" default="Preferred Phone"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'preferredPhone', 'errors')}">
            <g:textField name="preferredPhone" maxlength="20" size="20" value="${agentInstance?.preferredPhone}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="fax"><g:message code="agent.fax.label" default="Fax"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'fax', 'errors')}">
            <g:textField name="fax" maxlength="20" size="20" value="${agentInstance?.fax}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="email"><g:message code="agent.email.label" default="Email"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'email', 'errors')}">
            <g:textField name="email" maxlength="200" size="100" value="${agentInstance?.email}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="webPage"><g:message code="agent.webPage.label" default="Web Page"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'webPage', 'errors')}">
            <g:textArea name="webPage" cols="40" rows="5" value="${agentInstance?.webPage}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="optIn"><g:message code="agent.optIn.label" default="Opt In"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'optIn', 'errors')}">
            <g:checkBox name="optIn" value="${agentInstance?.optIn}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="enabled"><g:message code="agent.enabled.label" default="Enabled"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'enabled', 'errors')}">
            <g:checkBox name="enabled" value="${agentInstance?.enabled}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="lastModifiedBy"><g:message code="agent.lastModifiedBy.label" default="Last Modified By"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'lastModifiedBy', 'errors')}">
            <g:textField name="lastModifiedBy" value="${agentInstance?.lastModifiedBy}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="broker"><g:message code="agent.broker.label" default="Broker"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'broker', 'errors')}">

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="buyerListings"><g:message code="agent.buyerListings.label" default="Buyer Listings"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'buyerListings', 'errors')}">

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="notifications"><g:message code="agent.notifications.label" default="Notifications"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'notifications', 'errors')}">

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="office"><g:message code="agent.office.label" default="Office"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'office', 'errors')}">

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="responses"><g:message code="agent.responses.label" default="Responses"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'responses', 'errors')}">

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="sellerListings"><g:message code="agent.sellerListings.label" default="Seller Listings"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'sellerListings', 'errors')}">

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="surveyInvitationRequests"><g:message code="agent.surveyInvitationRequests.label" default="Survey Invitation Requests"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: agentInstance, field: 'surveyInvitationRequests', 'errors')}">

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
