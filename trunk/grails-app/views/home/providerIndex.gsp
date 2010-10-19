<html>
<head>
  <title>Welcome to Rate Your Experience</title>
  <meta name="layout" content="main"/>
  <style type="text/css" media="screen">

  #nav {
    margin-top: 20px;
    margin-left: 30px;
    width: 228px;
    float: left;

  }

  .homePagePanel * {
    margin: 0px;
  }

  .homePagePanel .panelBody ul {
    list-style-type: none;
    margin-bottom: 10px;
  }

  .homePagePanel .panelBody h1 {
    text-transform: uppercase;
    font-size: 1.1em;
    margin-bottom: 10px;
  }

  .homePagePanel .panelBody {
    background: url(images/leftnav_midstretch.png) repeat-y top;
    margin: 0px;
    padding: 15px;
  }

  .homePagePanel .panelBtm {
    background: url(images/leftnav_btm.png) no-repeat top;
    height: 20px;
    margin: 0px;
  }

  .homePagePanel .panelTop {
    background: url(images/leftnav_top.png) no-repeat top;
    height: 11px;
    margin: 0px;
  }

  h2 {
    margin-top: 15px;
    margin-bottom: 15px;
    font-size: 1.2em;
  }

  #pageBody {
    margin-left: 280px;
    margin-right: 20px;
  }
  </style>
</head>
<body>

<div id="pageBody">
  <h1>Rate Your Experience - ${fieldValue(bean: serviceProviderInstance, field: "companyName")}</h1>
  <div>
  <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <br/>
    <g:if test="${!person.isTOSCurrent()}">
      <modalbox:createLink controller="person" action="showCurrentTerms" title="Terms Of Service" width="500">
        <i><u>You Must Click Here To View and Accept Terms of Service</u></i>
      </modalbox:createLink>
      <br/>
    </g:if>
  </div>
  <div>
    <p>Welcome to your Provider Dashboard.  You can view drilldowns of responses for your company, or
    search reponses to produce reports.</p>
  </div>


  <div id="controllerList" class="indexSection">
    <h2>Reports:</h2>
    <ul>
      <li class="controller"><g:link controller="serviceProvider" action="serviceProviderRatingChart" id="${serviceProviderInstance?.id}">Service Provider Rating Chart</g:link></li>
      <li class="controller"><g:link controller="serviceProvider" action="show" id="${serviceProviderInstance?.id}">Provider Activity Summary</g:link></li>
      <li class="controller"><g:link controller="surveyResponse" action="search">Search For Survey Responses</g:link></li>
 
    </ul>

  </div>
  <div class="indexSection">
    <h2>Maintenance:</h2>
    <ul>
      <li class="controller"><g:link controller="person" action="changePassword" id="${person?.id}">Change Password</g:link></li>
    <li class="controller"><g:link controller="serviceProvider" action="edit" id="${serviceProviderInstance.id}">Opt-ins</g:link></li>
  
  
    </ul>
  </div>

</div>
</body>
</html>
