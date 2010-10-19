package notification

import grails.test.*

class NotificationMailerServiceTests extends grails.test.GrailsUnitTestCase {

    def notificationMailerService

    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testSomething() {

            def notification = new Notification(
              template:new EmailTemplate( requestForInformationBody:"requestForInformationBody")
              )

            notificationMailerService.sendRequestForInformation( notification)


    }
}
