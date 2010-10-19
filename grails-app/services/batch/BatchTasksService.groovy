package batch

import system.KeyValue
import transaction.RETransaction

class BatchTasksService {
    def notificationService

    boolean transactional = false

    def requestInformationFromAgent() {
        final def lastRunDateLabel = 'requestInformationFromAgentLastRunDate'

        def kv = KeyValue.findByKey(lastRunDateLabel)
        def lastRunDate = new Date(kv?.value ?: '2010/08/16 00:00:00')
        Date currentRunDate = new Date()

        println "Running ${this.class.name} $currentDate"

        def newTransactions = RETransaction.findAllByDateCreatedGreaterThan(lastRunDate)
        newTransactions.each { transaction ->
            //notificationService.newSoldListingEvent( transaction)
            println "${this.class.name} transaction=${transaction}"
        }

        if (!kv) kv = new KeyValue(key: lastRunDateLabel)
        kv.value = "${currentRunDate.format('yyyy/MM/dd hh:mm:ss')}"
        kv.save(flush: true)
    }
}
