<%@ page import="transaction.RETransaction" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'RETransaction.label', default: 'RETransaction')}"/>
  <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
  <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></span>
  <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></span>
</div>
<div class="body">
  <h1><g:message code="default.show.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="dialog">
    <table>
      <tbody>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="RETransaction.id.label" default="Id"/></td>

        <td valign="top" class="value">${fieldValue(bean: RETransactionInstance, field: "id")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="RETransaction.listing.label" default="Listing"/></td>

        <td valign="top" class="value"><g:link controller="listing" action="show" id="${RETransactionInstance?.listing?.id}">${RETransactionInstance?.listing?.encodeAsHTML()}</g:link></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="RETransaction.lastUpdated.label" default="Last Updated"/></td>

        <td valign="top" class="value"><g:formatDate date="${RETransactionInstance?.lastUpdated}"/></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="RETransaction.dateCreated.label" default="Date Created"/></td>

        <td valign="top" class="value">"${RETransactionInstance?.dateCreated?.format("yyyy-MM-dd")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="RETransaction.serviceProviders.label" default="Service Providers"/></td>

        <td valign="top" style="text-align: left;" class="value">
          <ul>
            <g:each in="${RETransactionInstance.serviceProviders}" var="s">
              <li><g:link controller="serviceProvider" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
            </g:each>
          </ul>
        </td>

      </tr>

      </tbody>
    </table>
  </div>


  <div class="buttons">
    <g:form>
      <g:hiddenField name="id" value="${RETransactionInstance?.id}"/>
      <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>
      <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
    </g:form>
  </div>

  <div class="actions">
    <span class="faux-button">
      <g:link action="newSoldListingEvent" params="[id:RETransactionInstance?.id]">
        Send Invitation Request to Agent [Override]
      </g:link>
    </span>
  </div>
</div>
</body>
</html>
