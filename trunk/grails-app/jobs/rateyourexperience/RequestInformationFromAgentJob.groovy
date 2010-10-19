package rateyourexperience




class RequestInformationFromAgentJob {
    def batchTasksService


    static triggers = {
        //simple name:'simpleTrigger', startDelay:20000, repeatInterval: 10000, repeatCount: 9

        //  midnight
        cron name: 'cronTriggerRequestInformationFromAgentJob', startDelay: 10000, cronExpression: '0 2 * * * ?'

    }

    def execute() {
        batchTasksService.requestInformationFromAgent()

    }
}
