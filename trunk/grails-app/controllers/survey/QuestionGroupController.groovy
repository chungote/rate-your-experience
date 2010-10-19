package survey

class QuestionGroupController {

    def scaffold = true
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [questionGroupInstanceList: QuestionGroup.list(params), questionGroupInstanceTotal: QuestionGroup.count()]
    }

    def create = {
        def questionGroupInstance = new QuestionGroup()
        questionGroupInstance.properties = params
        return [questionGroupInstance: questionGroupInstance]
    }

    def save = {
        def questionGroupInstance = new QuestionGroup(params)
        if (questionGroupInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'questionGroup.label', default: 'QuestionGroup'), questionGroupInstance.id])}"
            redirect(action: "show", id: questionGroupInstance.id)
        }
        else {
            render(view: "create", model: [questionGroupInstance: questionGroupInstance])
        }
    }

    def show = {
        def questionGroupInstance = QuestionGroup.get(params.id)
        if (!questionGroupInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'questionGroup.label', default: 'QuestionGroup'), params.id])}"
            redirect(action: "list")
        }
        else {
            [questionGroupInstance: questionGroupInstance]
        }
    }

    def edit = {
        def questionGroupInstance = QuestionGroup.get(params.id)
        if (!questionGroupInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'questionGroup.label', default: 'QuestionGroup'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [questionGroupInstance: questionGroupInstance]
        }
    }

    def update = {
        def questionGroupInstance = QuestionGroup.get(params.id)
        if (questionGroupInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (questionGroupInstance.version > version) {

                    questionGroupInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'questionGroup.label', default: 'QuestionGroup')] as Object[], "Another user has updated this QuestionGroup while you were editing")
                    render(view: "edit", model: [questionGroupInstance: questionGroupInstance])
                    return
                }
            }
            questionGroupInstance.properties = params
            if (!questionGroupInstance.hasErrors() && questionGroupInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'questionGroup.label', default: 'QuestionGroup'), questionGroupInstance.id])}"
                redirect(action: "show", id: questionGroupInstance.id)
            }
            else {
                render(view: "edit", model: [questionGroupInstance: questionGroupInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'questionGroup.label', default: 'QuestionGroup'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def questionGroupInstance = QuestionGroup.get(params.id)
        if (questionGroupInstance) {
            try {
                questionGroupInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'questionGroup.label', default: 'QuestionGroup'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'questionGroup.label', default: 'QuestionGroup'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'questionGroup.label', default: 'QuestionGroup'), params.id])}"
            redirect(action: "list")
        }
    }
}
