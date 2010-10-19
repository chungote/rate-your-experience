<%@ page import="security.Person" %>
<head>
</head>

<body>

<div>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${person}">
    <div class="errors">
      <g:renderErrors bean="${person}" as="list"/>
    </div>
  </g:hasErrors>
  <div id="result">
    <g:formRemote name="myForm" url="[controller: 'person', action:'updateTerms']" update="[success:'result']" onComplete="Modalbox.resizeToContent()">

      <div id="modalBoxText">
        ${person.getCurrentTOS()?.content}
      </div>



      <input type="hidden" name="id" value="${person.id}"/>
      <input type="hidden" name="termsOfServiceId" value="${person.getCurrentTOS().id}"/>

      <input type="submit" value="I Accept Terms of Use"/>

    </g:formRemote>
  </div>
  <div style="clear:both">
    <a href="#" title="Close window" onclick="Modalbox.hide();
    return false;">Close</a>
  </div>

</div>
</body>
