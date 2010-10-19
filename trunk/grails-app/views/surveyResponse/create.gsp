<%@ page import="org.ronintech.StringUtil; survey.SurveyResponse" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>

  <resource:tabView skin="default"/>
  <resource:rating skin="rating-trans"/>
  <resource:autoComplete skin="default"/>

  <link rel="stylesheet" href="${resource(dir: 'css', file: 'tabView.css')}"/>

</head>
<body>
<div class="body">
  <g:if test="${flash.message}">
    <div class="message">
      ${flash.message}
    </div>
  </g:if>
  <g:hasErrors bean="${surveyResponseInstance}">
    <div class="errors">
      <g:renderErrors bean="${surveyResponseInstance}" as="list"/>
    </div>
  </g:hasErrors>

  <div class="dialog">

    <div class="welcome">
      ${surveyResponseInstance.survey.welcome}
    </div>

    <g:form action="save" method="post">
      <g:hiddenField name="surveyId" value="${ surveyResponseInstance?.survey?.id }"/>
      <g:hiddenField name="notificationId" value="${ surveyResponseInstance?.notification?.id }"/>
      <div class="list">
        <richui:tabView id="tabView">
          <richui:tabLabels>
            <richui:tabLabel title="Service Providers" selected="true"/>

            <g:each status="i" var="type" in="${serviceProviderList}">
              <richui:tabLabel title="${StringUtil.properCase(type)}"/>
            </g:each>
          </richui:tabLabels>
          <richui:tabContents>

            <richui:tabContent>
              <h1>Validate Service Provider Information</h1>
              <p>
                Please make sure that the service providers listed below are accurate.
                If not, you may enter the name of the appropriate company in the space provided.
                (as you type, the system will search for providers and you can pick them from a resulting list)
              </p>
              <g:render
                      template="/surveyInvitationRequest/serviceProviderEdit"
                      model="['surveyInvitationRequestInstance':surveyInvitationRequestInstance]"/>
            </richui:tabContent>

            <g:each status="i" var="type" in="${serviceProviderList}">

              <richui:tabContent>
                <g:set var="group" value="${surveyResponseInstance?.survey?.groups?.find{it.type == type}}"/>
                <g:if test="${group?.questions}">
                  <g:render template="editGroup" model="['group':group, 'type':type,'prefix':'groups['+i+'].']"/>
                </g:if>
              </richui:tabContent>
            </g:each>

          </richui:tabContents>
        </richui:tabView>
      </div>

      <div class="buttons">
        <span class="button">
          <g:submitButton name="save" class="save"
                  value="${message(code: 'default.button.save.label', default: 'Save')}"/>
        </span>
      </div>
    </g:form>

  </div>
</div>
</body>
</html>
