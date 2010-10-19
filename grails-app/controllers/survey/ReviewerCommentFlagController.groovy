package survey
import security.*

class ReviewerCommentFlagController {

	  def authenticateService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def questionResponseInstance=QuestionResponse.get(params.id)
        [reviewerCommentFlagInstanceList: questionResponseInstance.commentFlags]
    }

     def listReview = {
	        params.max = Math.min(params.max ? params.int('max') : 10, 100)
	        def questionResponseInstance=QuestionResponse.get(params.id)
	        [reviewerCommentFlagInstanceList: questionResponseInstance.commentFlags]
    }

    def create = {
		println params
		def questionResponseInstance = QuestionResponse.get(params.id)
        def reviewerCommentFlagInstance = new ReviewerCommentFlag()
        reviewerCommentFlagInstance.properties = params
        return [reviewerCommentFlagInstance: reviewerCommentFlagInstance,questionResponseInstance:questionResponseInstance]
    }

    def save = {
		println params
        def questionResponseInstance = QuestionResponse.get(params.questionResponse_id)
        def reviewerCommentFlagInstance = new ReviewerCommentFlag(params)
        if (reviewerCommentFlagInstance.createdBy==null) {
			reviewerCommentFlagInstance.createdBy=authenticateService.userDomain()
		}

		questionResponseInstance.addToCommentFlags(reviewerCommentFlagInstance)
        if (questionResponseInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'reviewerCommentFlag.label', default: 'ReviewerCommentFlag'), reviewerCommentFlagInstance.id])}"
            redirect(action: "show", id: reviewerCommentFlagInstance.id)
        }
        else {
            render(view: "create", model: [reviewerCommentFlagInstance: reviewerCommentFlagInstance])
        }
    }

    def show = {
        def reviewerCommentFlagInstance = ReviewerCommentFlag.get(params.id)
        if (!reviewerCommentFlagInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reviewerCommentFlag.label', default: 'ReviewerCommentFlag'), params.id])}"
            redirect(action: "list")
        }
        else {
            [reviewerCommentFlagInstance: reviewerCommentFlagInstance]
        }
    }

    def edit = {
		if(!authenticateService.ifAnyGranted("ROLE_ADMIN")){
			render "You are not authorized to respond to review requests"
		}

        def reviewerCommentFlagInstance = ReviewerCommentFlag.get(params.id)
        if (!reviewerCommentFlagInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reviewerCommentFlag.label', default: 'ReviewerCommentFlag'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [reviewerCommentFlagInstance: reviewerCommentFlagInstance]
        }
    }

    def update = {
        if(!authenticateService.ifAnyGranted("ROLE_ADMIN")){
					render "You are not authorized to update review requests"
		}


        def reviewerCommentFlagInstance = ReviewerCommentFlag.get(params.id)
        if (reviewerCommentFlagInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (reviewerCommentFlagInstance.version > version) {

                    reviewerCommentFlagInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'reviewerCommentFlag.label', default: 'ReviewerCommentFlag')] as Object[], "Another user has updated this ReviewerCommentFlag while you were editing")
                    render(view: "edit", model: [reviewerCommentFlagInstance: reviewerCommentFlagInstance])
                    return
                }
            }
            reviewerCommentFlagInstance.properties = params
            reviewerCommentFlagInstance.reviewedBy=authenticateService.userDomain()
            reviewerCommentFlagInstance.dateReviewed=new Date()


            if (!reviewerCommentFlagInstance.hasErrors() && reviewerCommentFlagInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'reviewerCommentFlag.label', default: 'ReviewerCommentFlag'), reviewerCommentFlagInstance.id])}"
                redirect(action: "show", id: reviewerCommentFlagInstance.id)
            }
            else {
                render(view: "edit", model: [reviewerCommentFlagInstance: reviewerCommentFlagInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reviewerCommentFlag.label', default: 'ReviewerCommentFlag'), params.id])}"
            redirect(action: "list")
        }
    }
/*
    def delete = {
        def reviewerCommentFlagInstance = ReviewerCommentFlag.get(params.id)
        if (reviewerCommentFlagInstance) {
            try {
                reviewerCommentFlagInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'reviewerCommentFlag.label', default: 'ReviewerCommentFlag'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'reviewerCommentFlag.label', default: 'ReviewerCommentFlag'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reviewerCommentFlag.label', default: 'ReviewerCommentFlag'), params.id])}"
            redirect(action: "list")
        }
    }
    */
}
