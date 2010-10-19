<%@ page import="system.PrivacyPolicy" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <g:set var="entityName" value="${message(code: 'privacyPolicy.label', default: 'PrivacyPolicy')}"/>
  <title>Privacy Policy</title>
</head>
<body>
<div class="body">
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>

  <div id="modalBoxText">
    ${privacyPolicyInstance.content}
  </div>

</div>
</body>
</html>
