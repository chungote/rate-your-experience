            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="companyName" title="${message(code: 'broker.companyName.label', default: 'Brokerage')}" />
                           <g:sortableColumn property="city" title="${message(code: 'broker.city.label', default: 'City')}" />
 			<g:sortableColumn property="zip" title="${message(code: 'broker.zip.label', default: 'Zip')}" />                       
 			<g:sortableColumn property="mlsStatus" title="${message(code: 'broker.mlsStatus.label', default: 'MLS Status')}" />                       
                            
                        </tr>
                    </thead>
                    <tbody>
                    
                    <g:each in="${brokerInstanceList}" status="i" var="brokerInstance">
                        
			      
			
			
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        <td><g:link action="show" id="${brokerInstance.id}">${fieldValue(bean: brokerInstance, field: "companyName")}</g:link></td>
                            <td><g:link action="show" id="${brokerInstance.id}">${fieldValue(bean: brokerInstance, field: "city")}</g:link> </td>
                            <td><g:link action="show" id="${brokerInstance.id}">${fieldValue(bean: brokerInstance, field: "zip")} </g:link></td>
                            <td><g:link action="show" id="${brokerInstance.id}">${fieldValue(bean: brokerInstance, field: "mlsStatus")}</g:link> </td>
                         </tr>
                        
			                       
                       
                                            
                    </g:each>
                    </tbody>
                </table>
            </div>
