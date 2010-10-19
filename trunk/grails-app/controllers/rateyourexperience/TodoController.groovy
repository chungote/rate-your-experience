package rateyourexperience
import security.*


class TodoController {

	def notificationStatisticsService
    def authenticateService
    def index = { }

    def reminders = {


        Person user = authenticateService.userDomain()

		[surveyPendingTotal:notificationStatisticsService.getSurveyPendingTotal(user),
		reviewPendingTotal:notificationStatisticsService.getReviewPendingTotal(user),
		agentNonResponderTotal:notificationStatisticsService.getAgentNonResponderTotal(user),
		flaggedReviewTotal:notificationStatisticsService.getFlaggedReviewTotal(user)
		]

		}
}
