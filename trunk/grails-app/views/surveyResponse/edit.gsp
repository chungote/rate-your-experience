<%@ page import="org.ronintech.StringUtil; survey.SurveyResponse" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'surveyResponse.label', default: 'Survey Response')}"/>
  <title><g:message code="default.show.label" args="[entityName]"/></title>
  <resource:tabView skin="default"/>
  <resource:rating skin="rating-trans"/>
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'tabView.css')}"/>
  <g:javascript library="application"/>
  <modalbox:modalIncludes/>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
  <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></span>
</div>
<div class="body">
  <h1><g:message code="default.show.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${surveyResponseInstance}">
    <div class="errors">
      <g:renderErrors bean="${surveyResponseInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form>
    <div class="list">
      <richui:tabView id="tabView">
        <richui:tabLabels>
          <richui:tabLabel title="General Info"/>

          <g:each status="i" var="type" in="${serviceProviderList}">
            <richui:tabLabel title="${StringUtil.properCase(type)}" selected="${(type==serviceProviderDefault)?'true':'false'}"/>
          </g:each>


          <richui:tabLabel title="Rebuttal"/>
        </richui:tabLabels>
        <richui:tabContents>
          <richui:tabContent>
            <div class="dialog">
              <table>
                <tbody>

                <tr class="prop">
                  <td valign="top" class="name">
                    <div class="sResponse">
                      Rating:
                    </div>
                  </td>
                  <td valign="top" style="text-align: left;" class="value">
                    <div class="sResponse">
                      <richui:rating dynamic="false" rating="${surveyResponseInstance.ratingAverage}" units="5" showCurrent="true"/>
                    </div>
                  </td>
                </tr>
                <tr class="prop">
                  <td valign="top" class="name"><g:message code="surveyResponse.id.label" default="Id"/></td>

                  <td valign="top" class="value">${fieldValue(bean: surveyResponseInstance, field: "id")}</td>

                </tr>

                <tr class="prop">
                  <td valign="top" class="name"><g:message code="surveyResponse.survey.label" default="Survey"/></td>

                  <td valign="top" class="value"><g:link controller="survey" action="show" id="${surveyResponseInstance?.survey?.id}">${surveyResponseInstance?.survey?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                  <td valign="top" class="name"><g:message code="surveyResponse.lastUpdated.label" default="Last Updated"/></td>

                  <td valign="top" class="value"><g:formatDate date="${surveyResponseInstance?.lastUpdated}"/></td>

                </tr>

                <tr class="prop">
                  <td valign="top" class="name"><g:message code="surveyResponse.dateCreated.label" default="Date Created"/></td>

                  <td valign="top" class="value">${surveyResponseInstance?.dateCreated?.format("yyyy-MM-dd")}</td>

                </tr>

                <tr class="prop">
                  <td valign="top" class="name"><h2><g:message code="surveyResponse.responses.label" default="Responses:"/></h2></td>

                  <td valign="top" style="text-align: left;" class="value">
                  </td>
                </tr>

                </tbody>
              </table>
            </div>
          </richui:tabContent>


          <g:each status="i" var="type" in="${serviceProviderList}">
            <richui:tabContent>
              <g:render template="reviewGroup" model="['responses':surveyResponseInstance?.responses, 'group':surveyResponseInstance?.survey?.groups?.find{it.type == type}, 'type':type,'prefix':'groups['+i+'].']"/>
            </richui:tabContent>
          </g:each>

          <richui:tabContent>
            <div class="sRebuttal">
              <g:textField name="rebuttal" value="${surveyResponseInstance.rebuttal}" size="140"/>
            </div>
          </richui:tabContent>

        </richui:tabContents>
      </richui:tabView>

    </div>
    <div class="buttons">

    <g:hiddenField name="id" value="${surveyResponseInstance?.id}"/>
    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>
  </g:form>
</div>
  <g:ifAllGranted role="ROLE_ADMIN">
    <div class="actions">
      <span class="faux-button">
        <g:link action="clientCompletesSurveyEvent" params="[id:surveyResponseInstance?.id, notificationId:surveyResponseInstance?.notification?.id]">
          Send Completed Survey Message to Agent and Admin [Override]
        </g:link>
      </span>
      <span class="faux-button">
        <g:link action="adminReviewedSurveyResponseEvent" params="[id:surveyResponseInstance?.id, notificationId:surveyResponseInstance?.notification?.id]">
          Approve for Display [Admin]
        </g:link>
      </span>
    </div>
  </g:ifAllGranted>
</div>
</body>
</html>
