<%@ page import="survey.QuestionGroup; survey.Survey" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}"/>
  <title><g:message code="default.edit.label" args="[entityName]"/></title>
  <resource:tabView skin="default"/>
  <resource:rating skin="rating-trans"/>
  <resource:accordion skin="custom"/>
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'accordion.css')}"/>
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'tabView.css')}"/>
  <g:javascript library="yui"/>

  <script type="text/javascript">
    //<![CDATA[
    var questions = {
      linkDivClass: "addQuestion",

      unit: new Object(), // assoc array
      re: /--size--/g,

      onLoad: function () {
        var eArr = YAHOO.util.Dom.getElementsByClassName(this.linkDivClass, 'div');

        for (var i = 0, len = eArr.length; i < len; i++) {
          var e = eArr[i];
          var o = new Object();
          o.remoteLink = e.getElementsByTagName('a')[0];
          o.onClickString = o.remoteLink.getAttribute('onclick');
          o.href = o.remoteLink.getAttribute('href');

          // set index to size
          o.remoteLink.setAttribute('onclick', o.onClickString.replace(this.re, sizes[e.id]));
          o.remoteLink.setAttribute('href', o.href.replace(this.re, sizes[e.id]));

          this.unit[e.id] = o;
          //alert(o.remoteLink.getAttribute('onclick'));
        }
      },

      addQuestion: function (id, newId, insertBeforeDiv) {
        //alert(newId +"->"+insertBeforeDiv);

        var el = document.createElement('div');
        el.id = newId.replace(this.re, this.unit[id].size);

        var holder = YAHOO.util.Dom.get(insertBeforeDiv);
        YAHOO.util.Dom.insertBefore(el, holder);

        // reset size
        sizes[id]++;
        this.unit[id].remoteLink.setAttribute('onclick', this.unit[id].onClickString.replace(this.re, sizes[id]));
        this.unit[id].remoteLink.setAttribute('href', this.unit[id].href.replace(this.re, sizes[id]));
        return el;
      }
    };
    var sizes = {};
    //]]>
  </script>

</head>
<body onload="questions.onLoad();">
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
  <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></span>
  <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></span>
  <span class="menuButton"><g:link controller="surveyResponse" action="preview" id="${surveyInstance.id}">Preview Survey</g:link></span>
</div>
<div class="body">
  <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${surveyInstance}">
    <div class="errors">
      <g:renderErrors bean="${surveyInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form method="post">
    <g:hiddenField name="id" value="${surveyInstance?.id}"/>
    <g:hiddenField name="version" value="${surveyInstance?.version}"/>

    <richui:tabView id="tabView">
      <richui:tabLabels>
        <richui:tabLabel selected="true" title="General Info"/>
        <richui:tabLabel title="Demographics"/>
        <richui:tabLabel title="Agent"/>
        <richui:tabLabel title="Attorney"/>
        <richui:tabLabel title="House Inspector"/>
        <richui:tabLabel title="Lender"/>
        <richui:tabLabel title="Mold Inspector"/>
        <richui:tabLabel title="Radon Inspector"/>
        <richui:tabLabel title="Termite Inspector"/>
      </richui:tabLabels>
      <richui:tabContents>

        <richui:tabContent>
          <div class="dialog">
            <table>
              <tbody>

              <tr class="prop">
                <td valign="top" class="name">
                  <label for="name"><g:message code="survey.name.label" default="Name"/></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'name', 'errors')}">
                  <g:textField name="name" value="${surveyInstance?.name?.decodeHTML()}"/>
                </td>
              </tr>


              <tr class="prop">
                <td valign="top" class="name">
                  <label for="welcome"><g:message code="survey.welcome.label" default="Welcome"/></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'welcome', 'errors')}">
                  <g:textField name="welcome" value="${surveyInstance?.welcome?.decodeHTML()}"/>
                </td>
              </tr>

              <tr class="prop">
                <td valign="top" class="name">
                  <label for="thankYou"><g:message code="survey.thankYou.label" default="Thank You"/></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'thankYou', 'errors')}">
                  <g:textField name="thankYou" value="${surveyInstance?.thankYou?.decodeHTML()}"/>
                </td>
              </tr>
              </tbody>
            </table>
          </div>

        </richui:tabContent>
        <g:each status="i" var="type" in="${QuestionGroup.SERVICE_PROVIDER_TYPE_LIST}">

          <richui:tabContent>

            <g:render template="/questionGroup/edit" model="['questionGroupInstance':surveyInstance.groups.find{it.type == type}, 'type':type,'prefix':'groups['+i+'].']"/>

          </richui:tabContent>
        </g:each>

      </richui:tabContents>
    </richui:tabView>


    <div class="buttons">
      <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>

    </div>
  </g:form>
</div>

</body>
</html>
