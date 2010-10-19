package transaction

import notification.Notification
import participant.ServiceProvider

/**
 * User: Paula
 * Date: Mar 4, 2010
 * Time: 12:12:42 PM
 *
 */
class RETransaction {

    Listing listing
    Date dateCreated
    Date lastUpdated

    static hasMany = [serviceProviders: ServiceProvider]

    String toString() {
        "transaction:${listing?.mlsNumber}:${listing?.streetAddress},${listing?.city}"
    }

    static transients = [
            "notification"
    ]

    def getNotification() {
        return Notification.findByTransaction(this)
    }
}
