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
    margin-left: 80px;
    margin-right: 20px;
  }
  </style>
</head>
<body>

<div id="pageBody">
  <h1>Rate Your Experience - Admin Home</h1>
  <p>Welcome to the Administrative Dashboard.  We have provided you with all of the tools
  you will need to manage users, create surveys, and produce reports.</p>

  <div id="controllerList" class="dialog">
    <div class="indexSection">
      <h2>Activity Reports:</h2>
      <ul>

        <li class="controller"><g:link controller="surveyResponse" action="search">Survey Responses</g:link></li>
        <li class="controller"><g:link controller="broker" action="list">Broker Activity</g:link></li>
        <li class="controller"><g:link controller="agent" action="list">Agent Activity</g:link></li>
        <li class="controller"><g:link controller="serviceProvider" action="list">Service Provider Activity</g:link></li>

      </ul>

    </div>
    <div class="indexSection">
      <h2>My Tasks:</h2>
      <ul>
        <li class="controller"><g:link controller="surveyResponse" action="pendingApprovalList">Review Surveys, Responses and Rebuttals</g:link></li>
        <% /*<li class="controller"><g:link controller="surveyResponse" action="list">View Survey Responses</g:link></li>
					<li class="controller"><g:link controller="RETransaction" action="list">Generate a survey information request for a transaction</g:link></li>
					*/ %>
        <li class="controller"><g:link controller="surveyInvitationRequest" action="list">View and Generate Survey Information Requests</g:link></li>

      </ul>
    </div>
    <div class="indexSection">
      <h2>Survey Builder and Email Templates:</h2>
      <ul>

        <li class="controller"><g:link controller="survey" action="list">Survey Builder</g:link></li>
        <li class="controller"><g:link controller="emailTemplate" action="edit" id="1">Email Templates</g:link></li>

      </ul>
    </div>
    
    <div class="indexSection">
          <h2>Manage Users, Terms of Service, and Privacy Policy:</h2>
      <ul>
 		<li class="controller"><g:link controller="person" action="list">User Accounts</g:link></li>     
 		<li class="controller"><g:link controller="broker" action="editList">Manage Broker Opt-In</g:link></li>
 		<li class="controller"><g:link controller="agent" action="editList">Manage Individual Opt-In</g:link></li>
 		<li class="controller"><g:link controller="serviceProvider" action="editList">Manage Service Providers</g:link></li>
               <li class="controller"><g:link controller="termsOfService" action="list">Terms of Service</g:link></li>
               <li class="controller"><g:link controller="privacyPolicy" action="list">Privacy Policy</g:link></li>
               <li class="controller"><g:link controller="config" action="edit" id="1">System-Wide Options</g:link></li>
      </ul>
    </div>
    
  </div>
</div>
</body>
</html>