<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Designate Alternate Contact</title>
  </head>
  
  <body>
  
  <div class="nav">
    <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}">Home</a></span>
  </div>
  
  <div class="body">
    <h1>Designate Alternate Contact</h1>
    <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
    </g:if>
  <g:form method="post">
      
  <div class="list">
    <table>
      <thead>
      <tr>
        <g:sortableColumn property="hasAlternateContact" title="Alternate Contact Enabled"/>
        <g:sortableColumn property="username" title="Login Name"/>
        <g:sortableColumn property="userRealName" title="Full Name"/>
        <th>Alternate Contact</th>
        
       
      </tr>
      </thead>
      <tbody>
      <g:each in="${personList}" status="i" var="person">
        <tr class="odd">
          <g:hiddenField name="id" value="${person?.id}"/>
          <td><g:checkBox name="hasAlternateContact" value="${person?.hasAlternateContact}" /></td>
          <td>${fieldValue(bean:person, field:"username")}</td>
          <td>${fieldValue(bean:person,field:"userRealName")}</td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'alternateContactId', 'errors')}">
	     <g:textField name="alternatContactId" value="${person?.alternateContactId}" />
          </td>
          
        </tr>
      </g:each>
      </tbody>
    </table>
  </div>
   <div class="buttons">
      <span class="button"><g:actionSubmit class="save" action="updateList" value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>
    
    </div>
 </div>
 </g:form>
</body>
</html>