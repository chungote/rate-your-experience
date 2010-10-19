<%@ page import="notification.SurveyInvitationRequest" %>
<g:hiddenField name="surveyInvitationRequest.id" value="${surveyInvitationRequestInstance?.id}"/>
<g:hiddenField name="surveyInvitationRequest.version" value="${surveyInvitationRequestInstance?.version}"/>
<div class="dialog">
  <table>
    <tbody>

    <tr class="prop">
      <td valign="top" class="name">
        <label for="surveyInvitationRequest.lender.lookupName"><g:message code="surveyInvitationRequest.lender.label" default="Lender"/></label>
      </td>
      <td valign="top" class="value ${hasErrors(bean: surveyInvitationRequestInstance, field: 'lender', 'errors')}">
        <g:hiddenField name="surveyInvitationRequest.lender.id" value="${surveyInvitationRequestInstance?.lender?.id}"/>

        <richui:autoComplete name="surveyInvitationRequest.lender.lookupName"
                minQueryLength="1"
                queryDelay="1"
                delimChar=""
                controller="surveyInvitationRequest"
                action="searchAJAXLenderProviders"
                forceSelection="true"
                value="${surveyInvitationRequestInstance?.lender?.lookupName}"
                onItemSelect="\$('surveyInvitationRequest.lender.id').value = id"/>

      </td>
    </tr>

    <tr class="prop">
      <td valign="top" class="name">
        <label for="surveyInvitationRequest.houseInspector.lookupName"><g:message code="surveyInvitationRequest.houseInspector.label" default="House Inspector"/></label>
      </td>
      <td valign="top" class="value ${hasErrors(bean: surveyInvitationRequestInstance, field: 'houseInspector', 'errors')}">
        <g:hiddenField name="surveyInvitationRequest.houseInspector.id" value="${surveyInvitationRequestInstance?.houseInspector?.id}"/>

        <richui:autoComplete name="surveyInvitationRequest.houseInspector.lookupName"
                minQueryLength="1"
                queryDelay="1"
                delimChar=""
                controller="surveyInvitationRequest"
                action="searchAJAXHouseInspectorProviders"
                forceSelection="true"
                value="${surveyInvitationRequestInstance?.houseInspector?.lookupName}"
                onItemSelect="\$('surveyInvitationRequest.houseInspector.id').value = id"/>

      </td>
    </tr>

    <tr class="prop">
      <td valign="top" class="name">
        <label for="surveyInvitationRequest.radonInspector.lookupName"><g:message code="surveyInvitationRequest.radonInspector.label" default="Radon Inspector"/></label>
      </td>
      <td valign="top" class="value ${hasErrors(bean: surveyInvitationRequestInstance, field: 'radonInspector', 'errors')}">
        <g:hiddenField name="surveyInvitationRequest.radonInspector.id" value="${surveyInvitationRequestInstance?.radonInspector?.id}"/>

        <richui:autoComplete name="surveyInvitationRequest.radonInspector.lookupName"
                minQueryLength="1"
                queryDelay="1"
                delimChar=""
                controller="surveyInvitationRequest"
                action="searchAJAXRadonInspectorProviders"
                forceSelection="true"
                value="${surveyInvitationRequestInstance?.radonInspector?.lookupName}"
                onItemSelect="\$('surveyInvitationRequest.radonInspector.id').value = id"/>

      </td>
    </tr>

    <tr class="prop">
      <td valign="top" class="name">
        <label for="surveyInvitationRequest.termiteInspector.lookupName"><g:message code="surveyInvitationRequest.termiteInspector.label" default="Termite Inspector"/></label>
      </td>
      <td valign="top" class="value ${hasErrors(bean: surveyInvitationRequestInstance, field: 'termiteInspector', 'errors')}">
        <g:hiddenField name="surveyInvitationRequest.termiteInspector.id" value="${surveyInvitationRequestInstance?.termiteInspector?.id}"/>

        <richui:autoComplete name="surveyInvitationRequest.termiteInspector.lookupName"
                minQueryLength="1"
                queryDelay="1"
                delimChar=""
                controller="surveyInvitationRequest"
                action="searchAJAXTermiteInspectorProviders"
                forceSelection="true"
                value="${surveyInvitationRequestInstance?.termiteInspector?.lookupName}"
                onItemSelect="\$('surveyInvitationRequest.termiteInspector.id').value = id"/>

      </td>
    </tr>

    <tr class="prop">
      <td valign="top" class="name">
        <label for="surveyInvitationRequest.moldInspector.lookupName"><g:message code="surveyInvitationRequest.moldInspector.label" default="Mold Inspector"/></label>
      </td>
      <td valign="top" class="value ${hasErrors(bean: surveyInvitationRequestInstance, field: 'moldInspector', 'errors')}">
        <g:hiddenField name="surveyInvitationRequest.moldInspector.id" value="${surveyInvitationRequestInstance?.moldInspector?.id}"/>

        <richui:autoComplete name="surveyInvitationRequest.moldInspector.lookupName"
                minQueryLength="1"
                queryDelay="1"
                delimChar=""
                controller="surveyInvitationRequest"
                action="searchAJAXMoldInspectorProviders"
                forceSelection="true"
                value="${surveyInvitationRequestInstance?.moldInspector?.lookupName}"
                onItemSelect="\$('surveyInvitationRequest.moldInspector.id').value = id"/>

      </td>
    </tr>
    </tbody>
  </table>
</div>
