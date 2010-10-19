<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>

  <title>Agent Ratings Chart</title>

  <resource:dateChooser/>
  <g:javascript library="prototype"/>
  <script type="text/javascript" src="http://www.google.com/jsapi"></script>
  <script type="text/javascript">
    // fixes bug affecting Google visualization in prototype 1.6.0 or before
    Array.prototype.reduce = undefined;
  </script>

</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
</div>
<div class="body">
  <h1>My Agents</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:form action="agentRatingChart" method="post">
  <%--
    <g:formRemote name="chartForm" url="[action:'ratingChart']" update="ratingChart">
  --%>
    <g:hiddenField name="agent" value="$agent"/>
    <g:hiddenField name="id" value="$agent"/>
    <div class="dialog">
      <div class="criteria">
        <div class="chartFormElement" id="chartQuestionType">
          <label for="questionType"><g:message code="responseSearch.questionType.label" default="Question Type"/></label>
          <g:select name='questionType'
                  from='${questionTypeList}'
                  value="${questionType}"
                  noSelection="['':'Overall Rating']"/>
        </div>

        <div class="chartFormElement" id="chartDates">
          <label for="beginDate"><g:message code="responseSearch.beginDate.label" default="Date Range"/></label>
          <richui:dateChooser class="datechooser" name="beginDate" format="MM/dd/yyyy" value="${beginDate}"/>
          -
          <richui:dateChooser class="datechooser" name="endDate" format="MM/dd/yyyy" value="${endDate}"/>
        </div>

        <div class="chartFormElement" id="chartValue">
          <label for="chartValue"><g:message code="responseSearch.chartValue.label" default="Chart Value"/></label>
          <g:select name='chartValue'
                  from='${chartValueList}'
                  value="${chartValue}"/>
        </div>
      </div>
      <div class="chartFormElement" id="chartButtons">
        <input type="submit" value="Chart It!"/>
      </div>

      <div class="ratingChart">
        <g:render template="ratingChart" model="[title:title, columns:columns, data:data]"/>
      </div>

    </div>

  </g:form>
<%--
</g:formRemote>
--%></div>
</body>
</html>
