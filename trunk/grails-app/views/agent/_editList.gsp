            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="lastName" title="${message(code: 'agent.lastName.label', default: 'Name')}" />
                            <g:sortableColumn property="companyName" title="${message(code: 'agent.companyName.label', default: 'Company Name')}" />
                           <g:sortableColumn property="optInRatings" title="${message(code: 'agent.optInRatings.label', default: 'Ratings')}" />
                           <g:sortableColumn property="optInPublicDisplay" title="${message(code: 'agent.optInPublicDisplay.label', default: 'Public Display')}" />
 			<g:sortableColumn property="enabled" title="${message(code: 'agent.enabled.label', default: 'Enabled')}" />                       
 			<g:sortableColumn property="lastUpdated" title="${message(code: 'agent.lastUpdated.label', default: 'Last Updated')}" />
 			<th>&nbsp;</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                    
                    <g:each in="${agentInstanceList}" status="i" var="agentInstance">
                        
			      
			
			
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        <td><g:link action="edit" id="${agentInstance.id}">${fieldValue(bean: agentInstance, field: "lastName")},<br/>
                        ${fieldValue(bean: agentInstance, field: "firstName")}</g:link></td>
                        <td><g:link action="edit" id="${agentInstance.id}">${fieldValue(bean: agentInstance, field: "companyName")}</g:link></td>
                            <td><g:link action="edit" id="${agentInstance.id}">${fieldValue(bean: agentInstance, field: "optInRatings")}</g:link> </td>
                            <td><g:link action="edit" id="${agentInstance.id}">${fieldValue(bean: agentInstance, field: "optInPublicDisplay")}</g:link> </td>
                            <td><g:link action="edit" id="${agentInstance.id}">${fieldValue(bean: agentInstance, field: "enabled")} </g:link></td>
                            <td><g:link action="edit" id="${agentInstance.id}">${fieldValue(bean: agentInstance, field: "lastUpdated")}</g:link> </td>
                            <g:if test="${agentInstance.termsOfServiceId!=null}">
			    		
			    		<td><g:link controller="termsOfService" action="show" id="${agentInstance.termsOfServiceId}">View Terms of Service</g:link></td>
			    		
	</g:if>
			
                         </tr>
                        
			                       
                       
                                            
                    </g:each>
                    </tbody>
                </table>
            </div>
           
