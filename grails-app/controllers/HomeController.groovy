import security.*
class HomeController {

    def authenticateService

    def index = {
        if (authenticateService.ifAnyGranted("ROLE_ADMIN")) {
            render(view: "adminIndex")
        }
        else if (authenticateService.ifAnyGranted("ROLE_BROKER")) {
			Person user = authenticateService.userDomain()

		 	def brokerInstance=user.getParticipant()

		 	render view: 'brokerIndex', model: [brokerInstance:brokerInstance,person:user]
                    }
        else if (authenticateService.ifAnyGranted("ROLE_AGENT")) {
              Person user = authenticateService.userDomain()
			  def agentInstance=user.getParticipant()

		 	  render view: 'agentIndex', model: [agentInstance:agentInstance,person:user]

            }
         else if (authenticateService.ifAnyGranted("ROLE_PROVIDER")) {
			 println "inside provider"
			 Person user = authenticateService.userDomain()
			 def serviceProviderInstance=user.getParticipant()
			  render view: 'providerIndex', model: [serviceProviderInstance:serviceProviderInstance,person:user]
                }
    }

}