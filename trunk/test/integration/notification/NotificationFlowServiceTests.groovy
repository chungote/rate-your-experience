package notification

import grails.test.GrailsUnitTestCase

class NotificationFlowServiceTests extends GrailsUnitTestCase {

    NotificationFlowService mailer

    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testNewSoldListing() {

      def notification = new Notification(
              template:new EmailTemplate( requestForInformationBody:"requestForInformationBody")
      )

      mailer.newSoldListingEvent(notification)
    }
}