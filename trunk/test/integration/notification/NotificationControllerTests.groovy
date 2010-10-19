package notification

class NotificationControllerTests extends grails.test.ControllerUnitTestCase {

    void testAgentReport() {
        controller.authenticateService = authenticateService
        def result = controller.agentReport()
        println controller.modelAndView.model.dump()
        //assertEquals "bar", controller.response.
    }

}
