<%@ page import="org.ronintech.StringUtil" %>
<head>
  <meta name="layout" content="main"/>
  <title>Change Password</title>
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
  <h1>Change Password</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${person}">
    <div class="errors">
      <g:renderErrors bean="${person}" as="list"/>
    </div>
  </g:hasErrors>



  <g:form action="updatePassword">
    <input type="hidden" name="id" value="${person.id}"/>
    <input type="hidden" name="version" value="${person.version}"/>
    <div class="dialog">
      <table>
        <tbody>

   
        <tr class="prop">
          <td valign="top" class="name"><label for="passwd">Password:</label></td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'pass', 'errors')}">
            <input type="password" id="pass" name="pass" value="${person.pass?.encodeAsHTML()}"/>
          </td>
        </tr>

        </tbody>
      </table>
    </div>

    <div class="buttons">
      <span class="button"><g:actionSubmit class="save" value="UpdatePassword"/></span>
    </div>

  </g:form>

</div>
</body>
