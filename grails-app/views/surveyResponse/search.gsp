<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title>Search Survey Responses</title>
  <resource:dateChooser/>
  <resource:autoComplete skin="default"/>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
</div>
<div class="body">
  <h1>Search Survey Responses</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${responseSearchInstance}">
    <div class="errors">
      <g:renderErrors bean="${responseSearchInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form action="doSearch" method="post">
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="streetAddress"><g:message code="responseSearch.streetAddress.label" default="Street Address"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: responseSearchInstance, field: 'listings', 'errors')}">
            <%--
                  <g:select id="streetAddress" name='listings.id'
                          noSelection="${['null':'- Any -']}"
                          from='${responseSearchInstance.listingList}'
                          multiple='multiple'
                          optionKey="id" optionValue="streetAddress"
                          value="${responseSearchInstance?.listings}"/>
            --%>
            <richui:autoComplete name="streetAddress"
                    minQueryLength="1"
                    queryDelay="1"
                    delimChar="|"
                    action="searchAJAXStreetAddress"/>
          </td>
        </tr>
<g:ifAnyGranted role="ROLE_ADMIN,ROLE_BROKER,ROLE_AGENT">
        <tr class="prop">
          <td valign="top" class="name">
            <label for="mlsNumber"><g:message code="responseSearch.mlsNumber.label" default="MLS Number"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: responseSearchInstance, field: 'mlsNumber', 'errors')}">
            <g:textField name="mlsNumber" value="${responseSearchInstance?.mlsNumber}"/>
          </td>
        </tr>
 </g:ifAnyGranted>
<g:ifAnyGranted role="ROLE_ADMIN">
        <tr class="prop">
          <td valign="top" class="name">
            <label for="offices"><g:message code="responseSearch.branchOffices.label" default="Branch Offices"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: responseSearchInstance, field: 'offices', 'errors')}">
            <%--
            <g:select id="office" name='offices.mlsOfficeId'
                    noSelection="${['null':'- Any -']}"
                    from='${responseSearchInstance.officeList}'
                    multiple='multiple'
                    optionKey="mlsOfficeId"
                    value="${responseSearchInstance?.offices}"/>
            --%>
            <richui:autoComplete name="offices"
                    minQueryLength="1"
                    queryDelay="1"
                    delimChar="|"
                    action="searchAJAXOffice"/>
          </td>
        </tr>
 </g:ifAnyGranted>
<g:ifAnyGranted role="ROLE_ADMIN,ROLE_BROKER">
        <tr class="prop">
          <td valign="top" class="name">
            <label for="agents"><g:message code="responseSearch.agents.label" default="Agents"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: responseSearchInstance, field: 'agents', 'errors')}">
            <%--
            <g:select id="agent" name='agents.mlsAgentId'
                    noSelection="${['null':'- Any -']}"
                    from='${responseSearchInstance.agentList}'
                    multiple='multiple'
                    optionKey="mlsAgentId"
                    value="${responseSearchInstance?.agents}"/>
--%>
            <richui:autoComplete name="agents"
                    minQueryLength="1"
                    queryDelay="1"
                    delimChar="|"
                    action="searchAJAXAgent"/>
          </td>
        </tr>
</g:ifAnyGranted>
        <tr class="prop">
          <td valign="top" class="name">
            <label for="beginClosingDate"><g:message code="responseSearch.beginClosingDate.label" default="Begin Closing Date"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: responseSearchInstance, field: 'beginClosingDate', 'errors')}">
            <richui:dateChooser class="datechooser" name="beginClosingDate" format="MM/dd/yyyy" value="${responseSearchInstance?.beginClosingDate}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="endClosingDate"><g:message code="responseSearch.endClosingDate.label" default="End Closing Date"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: responseSearchInstance, field: 'endClosingDate', 'errors')}">
            <richui:dateChooser class="datechooser" name="endClosingDate" format="MM/dd/yyyy" value="${responseSearchInstance?.endClosingDate}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="past30Days"><g:message code="responseSearch.past30Days.label" default="Past 30 Days"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: responseSearchInstance, field: 'past30Days', 'errors')}">
            <g:checkBox name="past30Days" value="true"/>
          </td>
        </tr>
<g:ifAnyGranted role="ROLE_ADMIN,ROLE_AGENT,ROLE_BROKER">
        <tr class="prop">
          <td valign="top" class="name">
            <label for="serviceProviders"><g:message code="responseSearch.serviceProviders.label" default="Service Provider"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: responseSearchInstance, field: 'serviceProviders', 'errors')}">
            <%--
            <g:select name='serviceProviders.id'
                    noSelection="${['null':'- Any -']}"
                    from='${responseSearchInstance.serviceProviderList}'
                    multiple='multiple'
                    optionKey="id"
                    value="${responseSearchInstance?.serviceProviders}"/>
            --%>
            <richui:autoComplete name="serviceProviders"
                    minQueryLength="1"
                    queryDelay="1"
                    delimChar="|"
                    action="searchAJAXServiceProvider"/>
          </td>
        </tr>
</g:ifAnyGranted>
        </tbody>
      </table>
    </div>
    <div class="buttons">
      <span class="button"><g:submitButton name="doSearch" class="search" value="${message(code: 'default.button.search.label', default: 'Search')}"/></span>
    </div>
  </g:form>
</div>
</body>
</html>
