
<%@ page import="participant.Broker" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'broker.label', default: 'Broker')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <g:javascript library="prototype" />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
           
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            
             
	    
	                <g:formRemote name="search"  update="updateMe" 
	    	        action="editListSearch" url="${[action:'editListSearch']}">
	    	      Company Name: <input name="companyName" type="text"></input>
	    	      <input type="submit" name="search" value="Search"/>
	    	    </g:formRemote>
	    	    
	    <div id="updateMe">Type part or all or the company name and search.</div>
        </div>
        </div>
    </body>
</html>
