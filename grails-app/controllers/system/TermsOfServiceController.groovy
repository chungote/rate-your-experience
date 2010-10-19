package system

import security.Person

class TermsOfServiceController {


    def authenticateService


    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        if (!authenticateService.ifAnyGranted("ROLE_ADMIN")) {
            flash.message = "You do not have authorization to access this information"
        } else {
            params.max = Math.min(params.max ? params.int('max') : 10, 100)
            [termsOfServiceInstanceList: TermsOfService.list(params), termsOfServiceInstanceTotal: TermsOfService.count()]
        }
    }

    def create = {

        if (!authenticateService.ifAnyGranted("ROLE_ADMIN")) {
            redirect(action: "list", params: params)
        } else {
            def termsOfServiceInstance = new TermsOfService()
            termsOfServiceInstance.properties = params
            return [termsOfServiceInstance: termsOfServiceInstance]
        }
    }

    def save = {
        Person user = authenticateService.userDomain()
        if (!authenticateService.ifAnyGranted("ROLE_ADMIN")) {
            flash.message = "You do not have authorization to access this information"
            redirect(action: "list", params: params)
        }
        def termsOfServiceInstance = new TermsOfService(params)

        termsOfServiceInstance.modifiedBy = user
        if (termsOfServiceInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'termsOfService.label', default: 'TermsOfService'), termsOfServiceInstance.id])}"
            redirect(action: "edit", id: termsOfServiceInstance.id)
        }
        else {
            render(view: "create", model: [termsOfServiceInstance: termsOfServiceInstance])
        }
    }

    def show = {
        Person user = authenticateService.userDomain()
        if (!authenticateService.ifAnyGranted("ROLE_ADMIN")) {
            flash.message = "You do not have authorization to access this information"
            redirect(action: "list", params: params)
        } else {
            def termsOfServiceInstance = TermsOfService.get(params.id)
            if (!termsOfServiceInstance) {
                flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'termsOfService.label', default: 'TermsOfService'), params.id])}"
                redirect(action: "list")
            }
            else {
                [termsOfServiceInstance: termsOfServiceInstance]
            }
        }
    }

    def edit = {

        if (!authenticateService.ifAnyGranted("ROLE_ADMIN")) {
            redirect(action: "list", params: params)
        }
        def termsOfServiceInstance = TermsOfService.get(params.id)
        if (!termsOfServiceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'termsOfService.label', default: 'TermsOfService'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [termsOfServiceInstance: termsOfServiceInstance]
        }
    }

    def update = {
        if (!authenticateService.ifAnyGranted("ROLE_ADMIN")) {
            redirect(action: "list", params: params)
        }
        def termsOfServiceInstance = TermsOfService.get(params.id)
        Person user = authenticateService.userDomain()
        termsOfServiceInstance.modifiedBy = user
        if (termsOfServiceInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (termsOfServiceInstance.version > version) {

                    termsOfServiceInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'termsOfService.label', default: 'TermsOfService')] as Object[], "Another user has updated this TermsOfService while you were editing")
                    render(view: "edit", model: [termsOfServiceInstance: termsOfServiceInstance])
                    return
                }
            }
            termsOfServiceInstance.properties = params
            if (!termsOfServiceInstance.hasErrors() && termsOfServiceInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'termsOfService.label', default: 'TermsOfService'), termsOfServiceInstance.id])}"
                redirect(action: "edit", id: termsOfServiceInstance.id)
            }
            else {
                render(view: "edit", model: [termsOfServiceInstance: termsOfServiceInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'termsOfService.label', default: 'TermsOfService'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        if (!authenticateService.ifAnyGranted("ROLE_ADMIN")) {
            redirect(action: "list", params: params)
        }
        def termsOfServiceInstance = TermsOfService.get(params.id)
        if (termsOfServiceInstance) {
            try {
                termsOfServiceInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'termsOfService.label', default: 'TermsOfService'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'termsOfService.label', default: 'TermsOfService'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'termsOfService.label', default: 'TermsOfService'), params.id])}"
            redirect(action: "list")
        }
    }
}
