<%@ page import="org.ronintech.StringUtil" %>
<head>
  <meta name="layout" content="main"/>
  <title>Display User</title>
</head>

<body>

<div class="nav">
  <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}">Home</a></span>
  <span class="menuButton"><g:link class="list" action="list">Back to list</g:link></span>
  <span class="menuButton"><g:link class="create" action="create">Create a new User</g:link></span>
</div>

<div class="body">
  <h1>Show User</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="dialog">
    <table>
      <tbody>

      <tr class="prop">
        <td valign="top" class="name">ID:</td>
        <td valign="top" class="value">${person.id}</td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">Login Name:</td>
        <td valign="top" class="value">${person.username?.encodeAsHTML()}</td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">Full Name:</td>
        <td valign="top" class="value">${person.userRealName?.encodeAsHTML()}</td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name"><label for="enabled">Enabled:</label></td>
        <td valign="top" class="value ${hasErrors(bean: person, field: 'enabled', 'errors')}">
          <g:select name="type" from="${person.type.inList}" value="${person?.type}" valueMessagePrefix="person.type"/>
        </td>
      </tr>


      <tr class="prop">
        <td valign="top" class="name">Enabled:</td>
        <td valign="top" class="value">${person.enabled}</td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">Opt-in:</td>
        <td valign="top" class="value">${person.optIn}</td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">Description:</td>
        <td valign="top" class="value">${person.description?.encodeAsHTML()}</td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">Email:</td>
        <td valign="top" class="value">${person.email?.encodeAsHTML()}</td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">Show Email:</td>
        <td valign="top" class="value">${person.emailShow}</td>
      </tr>

      <g:if test="${termsOfServiceId!=null}">
        <tr class="prop">
          <td valign="top" class="name"><label for="termsOfServiceId">View Terms of Service Signed:</label></td>
          <td><g:link controller="termsOfService" action="show" id="${privacyPolicyInstance.termsOfServiceId}">View TOS</g:link></td>
        </tr>
      </g:if>

      <tr class="prop">
        <td valign="top" class="name">Roles:</td>
        <td valign="top" class="value">
          <ul>
            <g:each in="${roleNames}" var='name'>
              <li>${StringUtil.properCase(name.substring(5).toLowerCase())}</li>
            </g:each>
          </ul>
        </td>
      </tr>

      </tbody>
    </table>
  </div>

  <div class="buttons">
    <g:form>
      <input type="hidden" name="id" value="${person.id}"/>
      <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>

    </g:form>
  </div>

</div>
</body>
