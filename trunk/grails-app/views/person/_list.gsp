  <div class="list">
    <table>
      <thead>
      <tr>
         <g:sortableColumn property="username" title="Login Name"/>
        <g:sortableColumn property="userRealName" title="Full Name"/>
        <g:sortableColumn property="enabled" title="Enabled"/>
        <g:sortableColumn property="optIn" title="Opt-In"/>
        
        <th>&nbsp;</th>
      </tr>
      </thead>
      <tbody>
      <g:each in="${personList}" status="i" var="person">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
        
          <td><g:link action="edit" id="${person.id}">${person.username?.encodeAsHTML()}</g:link></td>
          <td><g:link action="edit" id="${person.id}">${person.userRealName?.encodeAsHTML()}</g:link></td>
          <td><g:link action="edit" id="${person.id}">${person.enabled?.encodeAsHTML()}</g:link></td>
          <td><g:link action="edit" id="${person.id}">${person.optIn?.encodeAsHTML()}</g:link></td>
          <g:if test="${person.termsOfServiceId!=null}">
	  	<td><g:link controller="termsOfService" action="show" id="${person.termsOfServiceId}">View Terms of Service</g:link></td>
	  </g:if>
          
        </tr>
      </g:each>
      </tbody>
    </table>
  </div>
