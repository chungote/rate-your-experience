<head>
  <meta name="layout" content="main"/>
  <title>Create Person</title>
</head>

<body>

<div class="nav">
  <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}">Home</a></span>
</div>

<div class="body">
  <h1>Create Broker Staff Account</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${person}">
    <div class="errors">
      <g:renderErrors bean="${person}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form action="save">
  <g:hiddenField name="type" value="broker"/>
  <g:hiddenField name="participantId" value="${brokerInstance?.id}"/>
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

        <tr class="prop">
          <td valign="top" class="name"><label for="enabled">Enabled:</label></td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'enabled', 'errors')}">
            <g:checkBox name="enabled" value="${person.enabled}"></g:checkBox>
          </td>
        </tr>
        
            
	<tr class="prop">
          <td valign="top" class="name"><label for="optIn">Opt-in:</label></td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'optIn', 'errors')}">
            <g:checkBox name="optIn" value="${person.optIn}"></g:checkBox>
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
            <input type="text" id="email" name="email" value="${person.email?.encodeAsHTML()}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name"><label for="emailShow">Show Email:</label></td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'emailShow', 'errors')}">
            <g:checkBox name="emailShow" value="${person.emailShow}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name" align="left">Assign Roles:</td>
        </tr>

        <g:each in="${authorityList}">
          <tr>
            <td valign="top" class="name" align="left">${it.authority.encodeAsHTML()}</td>
            <td align="left"><g:checkBox name="${it.authority}"/></td>
          </tr>
        </g:each>

        </tbody>
      </table>
    </div>

    <div class="buttons">
      <span class="button"><input class="save" type="submit" value="Create"/></span>
    </div>

  </g:form>

</div>
</body>
