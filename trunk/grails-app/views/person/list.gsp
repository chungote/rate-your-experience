<html>
<head>
  <meta name="layout" content="main"/>
  <title>User List</title>
    <g:javascript library="prototype" />
</head>

<body>

<div class="nav">
  <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}">Home</a></span>
  <span class="menuButton"><g:link class="create" action="create">Create a new User</g:link></span>
</div>

<div class="body">
  <h1>User List</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  
              <g:formRemote name="search"  update="updateMe" 
  	        action="doSearch" url="${[action:'doSearch']}" >

  	      Login: <input name="username" type="text"></input>
  	      Name: <input name="userRealName" type="text"></input>
  	      Email: <input name="email" type="text"></input>
  	      <input type="submit" name="search" value="Search"/>
 	    </g:formRemote>

 <div id="updateMe">Type part or all or the user's login, name or email and search.</div>
         </div>
</body>
</html>