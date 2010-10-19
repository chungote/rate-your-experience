package survey

class SurveyController {

	static navigation = [
	group:'tabs',
	order:150,
	title:'Survey',
	subItems:[
	[group:'tabs',action:'create',title:'create']
	]
	]


    def authenticateService
	def scaffold = true

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def beforeInterceptor = {
		println params.inspect()
	}

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {

		 if (!authenticateService.ifAnyGranted("ROLE_ADMIN")){
		flash.message = "You do not have authorization to access this information"
   }
       // params.max = Math.min(params.max ? params.int('max') : 10, 100)

        [surveyInstanceList: Survey.list(params), surveyInstanceTotal: Survey.count()]
    }

    def create = {
         if (!authenticateService.ifAnyGranted("ROLE_ADMIN")){
		        redirect(action: "list", params:params)
   }
        def surveyInstance = new Survey()
        surveyInstance.properties = params
        render(view: "edit", model: [surveyInstance: surveyInstance])
        //return [surveyInstance: surveyInstance]
    }

    def save = {
         if (!authenticateService.ifAnyGranted("ROLE_ADMIN")){
		        redirect(action: "list", params:params)
   }
        def surveyInstance = new Survey(params)
        if (surveyInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'survey.label', default: 'Survey'), surveyInstance.id])}"
            redirect(action: "edit", id: surveyInstance.id)
        }
        else {
            render(view: "create", model: [surveyInstance: surveyInstance])
        }
    }

    def show = {
         if (!authenticateService.ifAnyGranted("ROLE_ADMIN")){
		        redirect(action: "list", params:params)
   }
        def surveyInstance = Survey.get(params.id)
        if (!surveyInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
            redirect(action: "list")
        }
        else {
            [surveyInstance: surveyInstance]
        }
    }

    def edit = {
         if (!authenticateService.ifAnyGranted("ROLE_ADMIN")){
		        redirect(action: "list", params:params)
   }
        def surveyInstance = Survey.get(params.id)
        if (!surveyInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [surveyInstance: surveyInstance]
        }
    }

    def update = {
		 if (!authenticateService.ifAnyGranted("ROLE_ADMIN")){
		        redirect(action: "list", params:params)
   }
		if (!params.id) {
			return save()
		}
        def surveyInstance = Survey.get(params.id)
        if (surveyInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (surveyInstance.version > version) {

                    surveyInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'survey.label', default: 'Survey')] as Object[], "Another user has updated this Survey while you were editing")
                    render(view: "edit", model: [surveyInstance: surveyInstance])
                    return
                }
            }

            surveyInstance.properties = params
            if (!surveyInstance.hasErrors() && surveyInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'survey.label', default: 'Survey'), surveyInstance.id])}"
                redirect(action: "edit", id: surveyInstance.id)
            }
            else {
                render(view: "edit", model: [surveyInstance: surveyInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
         if (!authenticateService.ifAnyGranted("ROLE_ADMIN")){
		        redirect(action: "list", params:params)
   }
        def surveyInstance = Survey.get(params.id)
        if (surveyInstance) {
            try {
                surveyInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
            redirect(action: "list")
        }
    }
}
