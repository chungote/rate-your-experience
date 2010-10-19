<%@ page import="org.ronintech.StringUtil; survey.SurveyResponse" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <resource:tabView skin="default"/>
  <resource:rating skin="rating-trans"/>
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

    <g:form action="" method="post">
      <g:hiddenField name="surveyId" value="${ surveyResponseInstance?.survey?.id }"/>

      <div class="list">
        <richui:tabView id="tabView">
          <richui:tabLabels>
            <g:each status="i" var="type" in="${serviceProviderList}">
              <richui:tabLabel title="${StringUtil.properCase(type)}" selected="${(type==serviceProviderDefault)?'true':'false'}"/>
            </g:each>
          </richui:tabLabels>
          <richui:tabContents>

            <g:each status="i" var="type" in="${serviceProviderList}">

              <richui:tabContent>

                <g:render template="previewGroup" model="['group':surveyResponseInstance?.survey?.groups?.find{it.type == type}, 'type':type,'prefix':'groups['+i+'].']"/>

              </richui:tabContent>
            </g:each>

          </richui:tabContents>
        </richui:tabView>

      </div>


      <div class="buttons">
        <span class="button">
          <g:link controller="survey" action="edit" id="${surveyResponseInstance?.survey?.id}">Back to Survey</g:link>
        </span>
      </div>
    </g:form>

  </div>
</div>
</body>
</html>
