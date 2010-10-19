
<%@ page import="participant.Agent" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'config.label', default: 'Agent')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
          <resource:autoComplete skin="default"/>
          <script type="text/javascript">
	  //<![CDATA[
	  	function selectAllOptions(id)
	  	{
	  		var ref = document.getElementById(id);
	  		
	  		for(i=0; i<ref.options.length; i++)
	  			ref.options[i].selected = true;
	  	}
	  //]]>
</script>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
        </div>
        <div class="body">
            <h1>Create Alternate Contact</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:form action="addAlternateContact" method="post" >
                <div class="dialog">
                    <div>
                        Select agents for whom notifications will be handled by an
			alternate person. In order to select multiple agents, you must
			Ctrl-Click (or Cmd-Click on Mac) items.
			<br/>
			<input type="button" value="Select All" onclick="selectAllOptions('agentList');" /><br/>
		        <g:select name="agentList" from="${agentInstanceList}" optionKey="id" value="${id}" multiple="true" noSelection="['null': '']"/>
		     </div>
			<div>
			Type the name of the person you wish to
			designate as an alternate contact to receive notifications (i.e. Jane
			Doe).
			
			<br/>
			 <richui:autoComplete name="userRealName"
			                    minQueryLength="1"
			                    queryDelay="1"
			                    delimChar=""
                    			    action="searchAJAXUsers"/>
			                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="addAlternateContact" value="${message(code: 'default.button.create.label', default: 'Set Alternate Contact')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
