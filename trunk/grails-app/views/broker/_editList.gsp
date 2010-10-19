            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="companyName" title="${message(code: 'broker.companyName.label', default: 'Brokerage')}" />
                           <g:sortableColumn property="optInRatings" title="${message(code: 'broker.optInRatings.label', default: 'Opt In Ratings')}" />
                           <g:sortableColumn property="optInPublicDisplay" title="${message(code: 'broker.optInPublicDisplay.label', default: 'Opt In Public Display')}" />
 			<g:sortableColumn property="enabled" title="${message(code: 'broker.enabled.label', default: 'Enabled')}" />                       
 			<g:sortableColumn property="lastUpdated" title="${message(code: 'broker.lastUpdated.label', default: 'Last Updated')}" />
 			<th>&nbsp;</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                    
                    <g:each in="${brokerInstanceList}" status="i" var="brokerInstance">
                        
			      
			
			
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        <td><g:link action="edit" id="${brokerInstance.id}">${fieldValue(bean: brokerInstance, field: "companyName")}</g:link></td>
                            <td><g:link action="edit" id="${brokerInstance.id}">${fieldValue(bean: brokerInstance, field: "optInRatings")}</g:link> </td>
                            <td><g:link action="edit" id="${brokerInstance.id}">${fieldValue(bean: brokerInstance, field: "optInPublicDisplay")}</g:link> </td>
                            <td><g:link action="edit" id="${brokerInstance.id}">${fieldValue(bean: brokerInstance, field: "enabled")} </g:link></td>
                            <td><g:link action="edit" id="${brokerInstance.id}">${fieldValue(bean: brokerInstance, field: "lastUpdated")}</g:link> </td>
                            <g:if test="${brokerInstance.termsOfServiceId!=null}">
			    		
			    		<td><g:link controller="termsOfService" action="show" id="${brokerInstance.termsOfServiceId}">View Terms of Service</g:link></td>
			    		
	</g:if>
                         </tr>
                        
			                       
                       
                                            
                    </g:each>
                    </tbody>
                </table>
            </div>
           
