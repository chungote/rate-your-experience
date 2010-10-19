<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
  <title><g:layoutTitle default="RateYourExperience"/></title>
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}"/>
  <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>
  <modalbox:modalIncludes/>
  <g:javascript library="yui"/>
  <g:javascript library="application"/>
  <g:layoutHead/>
</head>
<body onload="${pageProperty(name: 'body.onload')}">
<div id="spinner" class="spinner" style="display:none;">
  <img src="${resource(dir: 'images', file: 'spinner.gif')}" alt="Spinner"/>
</div>
<div id="myHeader">
  <g:render template="/layouts/header"/>
  <div id="rightHeader">
    <g:render template="/layouts/login"/>
    <g:render template="/layouts/todo"/>
  </div>
</div><div id="left">

  <g:layoutBody/>
</div>
<div id="right">
  <g:render template="/layouts/right_images"/>
</div>
<div id="footer">
  <g:render template="/layouts/footer"/>
</div>
</body>
</html>
