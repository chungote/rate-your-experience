<%@ page import="org.ronintech.StringUtil" %>
<div class="list">
  <table>
    <thead>
    <tr>

   
     <g:sortableColumn property="type" title="${message(code: 'serviceProvider.type.label', default: 'Type')}"/>

      <g:sortableColumn property="companyName" title="${message(code: 'serviceProvider.companyName.label', default: 'Company Name')}"/>

      <g:sortableColumn property="streetAddress1" title="${message(code: 'serviceProvider.streetAddress1.label', default: 'Address')}"/>

      <g:sortableColumn property="city" title="${message(code: 'serviceProvider.city.label', default: 'City')}"/>

      <g:sortableColumn property="zip" title="${message(code: 'serviceProvider.zip.label', default: 'Zip')}"/>

    </tr>
    </thead>
    <tbody>
    <g:each in="${serviceProviderInstanceList}" status="i" var="serviceProviderInstance">
      <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
	 <td><g:link action="edit" id="${serviceProviderInstance.id}">${fieldValue(bean: serviceProviderInstance, field: "type")}</g:link></td>

     
        <td><g:link action="edit" id="${serviceProviderInstance.id}">${fieldValue(bean: serviceProviderInstance, field: "companyName")}</g:link></td>

        <td><g:link action="edit" id="${serviceProviderInstance.id}">${fieldValue(bean: serviceProviderInstance, field: "streetAddress1")}</g:link></td>

        <td><g:link action="edit" id="${serviceProviderInstance.id}">${StringUtil.properCase(serviceProviderInstance.city)}</g:link></td>

        <td><g:link action="edit" id="${serviceProviderInstance.id}">${fieldValue(bean: serviceProviderInstance, field: "zip")}</g:link></td>

      </tr>
    </g:each>
    </tbody>
  </table>
</div>
