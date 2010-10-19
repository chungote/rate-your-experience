<%@ page import="org.ronintech.StringUtil" %>
<head>
  <meta name="layout" content="main"/>
  <title>Edit User</title>
</head>

<body>

<div class="nav">
  <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}">Home</a></span>
  <g:ifAnyGranted role="ROLE_ADMIN">
    <span class="menuButton"><g:link class="list" action="list">Back to list</g:link></span>
    <span class="menuButton"><g:link class="create" action="create">Create a new User</g:link></span>
  </g:ifAnyGranted>
</div>

<div class="body">
  <h1>Edit User</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${person}">
    <div class="errors">
      <g:renderErrors bean="${person}" as="list"/>
    </div>
  </g:hasErrors>



  <g:form>
    <input type="hidden" name="id" value="${person.id}"/>
    <input type="hidden" name="version" value="${person.version}"/>
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name"><label for="username">Login Name:</label></td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'username', 'errors')}">
            <input type="text" id="username" name="username" value="${person.username?.encodeAsHTML()}" onChange="javascript:this.value=this.value.toLowerCase();"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name"><label for="userRealName">Full Name:</label></td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'userRealName', 'errors')}">
            <input type="text" id="userRealName" name="userRealName" value="${person.userRealName?.encodeAsHTML()}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name"><label for="passwd">Password:</label></td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'passwd', 'errors')}">
            <input type="password" id="passwd" name="passwd" value="${person.passwd?.encodeAsHTML()}"/>
          </td>
        </tr>

        <g:ifAnyGranted role="ROLE_ADMIN">
          <tr class="prop">
            <td valign="top" class="name"><label for="enabled">Type:</label></td>
            <td valign="top" class="value ${hasErrors(bean: person, field: 'type', 'errors')}">
              <g:select name="type" from="${person.constraints.type.inList}" value="${person?.type}" valueMessagePrefix="person.type"/>
            </td>
          </tr>
        </g:ifAnyGranted>
        <tr class="prop">
          <td valign="top" class="name"><label for="enabled">Opt-in:</label></td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'optIn', 'errors')}">
            <g:checkBox name="optIn" value="${person.optIn}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name"><label for="description">Description:</label></td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'description', 'errors')}">
            <input type="text" id="description" name="description" value="${person.description?.encodeAsHTML()}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name"><label for="email">Email:</label></td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'email', 'errors')}">
            <input type="text" id="email" name="email" value="${person?.email?.encodeAsHTML()}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name"><label for="emailShow">Show Email:</label></td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'emailShow', 'errors')}">
            <g:checkBox name="emailShow" value="${person.emailShow}"/>
          </td>
        </tr>
        <g:if test="${person.termsOfServiceId!=null}">
          <tr class="prop">
            <td valign="top" class="name"><label for="termsOfServiceId">View Terms of Service Signed:</label></td>
            <td><g:link controller="termsOfService" action="show" id="${person.termsOfServiceId}">View TOS</g:link></td>
          </tr>
        </g:if>
        <g:ifAnyGranted role="ROLE_ADMIN">
          <tr class="prop">
            <td valign="top" class="name"><label for="authorities">Roles:</label></td>
            <td valign="top" class="value ${hasErrors(bean: person, field: 'authorities', 'errors')}">
              <ul>
                <g:each var="entry" in="${roleMap}">
                  <li>
                    <g:checkBox name="${entry.key.authority}" value="${entry.value}"/>
                    ${StringUtil.properCase(entry.key.authority.substring(5).toLowerCase()).encodeAsHTML()}
                  </li>
                </g:each>
              </ul>
            </td>
          </tr>
        </g:ifAnyGranted>
        </tbody>
      </table>
    </div>

    <div class="buttons">
      <span class="button"><g:actionSubmit class="save" value="Update"/></span>
    </div>

  </g:form>

</div>
</body>
