package transaction

class RETransactionController {

    def notificationFlowService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [RETransactionInstanceList: RETransaction.list(params), RETransactionInstanceTotal: RETransaction.count()]
    }

    def create = {
        def RETransactionInstance = new RETransaction()
        RETransactionInstance.properties = params
        return [RETransactionInstance: RETransactionInstance]
    }

    def save = {
        def RETransactionInstance = new RETransaction(params)
        if (RETransactionInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'RETransaction.label', default: 'RETransaction'), RETransactionInstance.id])}"
            redirect(action: "show", id: RETransactionInstance.id)
        }
        else {
            render(view: "create", model: [RETransactionInstance: RETransactionInstance])
        }
    }

    def show = {
        def RETransactionInstance = RETransaction.get(params.id)
        if (!RETransactionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'RETransaction.label', default: 'RETransaction'), params.id])}"
            redirect(action: "list")
        }
        else {
            [RETransactionInstance: RETransactionInstance]
        }
    }

    def edit = {
        def RETransactionInstance = RETransaction.get(params.id)
        if (!RETransactionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'RETransaction.label', default: 'RETransaction'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [RETransactionInstance: RETransactionInstance]
        }
    }

    def update = {
        def RETransactionInstance = RETransaction.get(params.id)
        if (RETransactionInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (RETransactionInstance.version > version) {

                    RETransactionInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'RETransaction.label', default: 'RETransaction')] as Object[], "Another user has updated this RETransaction while you were editing")
                    render(view: "edit", model: [RETransactionInstance: RETransactionInstance])
                    return
                }
            }
            RETransactionInstance.properties = params
            if (!RETransactionInstance.hasErrors() && RETransactionInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'RETransaction.label', default: 'RETransaction'), RETransactionInstance.id])}"
                redirect(action: "show", id: RETransactionInstance.id)
            }
            else {
                render(view: "edit", model: [RETransactionInstance: RETransactionInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'RETransaction.label', default: 'RETransaction'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def RETransactionInstance = RETransaction.get(params.id)
        if (RETransactionInstance) {
            try {
                RETransactionInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'RETransaction.label', default: 'RETransaction'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'RETransaction.label', default: 'RETransaction'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'RETransaction.label', default: 'RETransaction'), params.id])}"
            redirect(action: "list")
        }
    }


    def newSoldListingEvent = {
        def transaction = RETransaction.get(params.id)
        notificationFlowService.newSoldListingEvent(transaction)
        flash.message = "Information Request Sent to Agent"
        redirect(action: "show", id: params.id)

    }
}
