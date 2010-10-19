package notification

class EmailTemplateController {

  def authenticateService
  def scaffold = true;
  static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

  def index = {
    redirect(action: "list", params: params)
  }

  def list = {
	   if (!authenticateService.ifAnyGranted("ROLE_ADMIN")){
		flash.message = "You do not have authorization to access this information"
   }
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    [emailTemplateInstanceList: EmailTemplate.list(params), emailTemplateInstanceTotal: EmailTemplate.count()]
  }

  def create = {
     if (!authenticateService.ifAnyGranted("ROLE_ADMIN")){
	        redirect(action: "list", params:params)
   }
    def emailTemplateInstance = new EmailTemplate()
    emailTemplateInstance.properties = params
    return [emailTemplateInstance: emailTemplateInstance]
  }

  def save = {
     if (!authenticateService.ifAnyGranted("ROLE_ADMIN")){
	        redirect(action: "list", params:params)
   }
    def emailTemplateInstance = new EmailTemplate(params)
    if (emailTemplateInstance.save(flush: true)) {
      flash.message = "${message(code: 'default.created.message', args: [message(code: 'emailTemplate.label', default: 'EmailTemplate'), emailTemplateInstance.id])}"
      redirect(action: "edit", id: emailTemplateInstance.id)
    }
    else {
      render(view: "create", model: [emailTemplateInstance: emailTemplateInstance])
    }
  }

  def edit = {
     if (!authenticateService.ifAnyGranted("ROLE_ADMIN")){
	        redirect(action: "list", params:params)
   }
    def emailTemplateInstance = EmailTemplate.get(params.id)
    if (!emailTemplateInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'emailTemplate.label', default: 'EmailTemplate'), params.id])}"
      redirect(action: "edit")
    }
    else {
      return [emailTemplateInstance: emailTemplateInstance]
    }
  }

  def update = {
     if (!authenticateService.ifAnyGranted("ROLE_ADMIN")){
	        redirect(action: "list", params:params)
   }
    def emailTemplateInstance = EmailTemplate.get(params.id)
    if (emailTemplateInstance) {
      if (params.version) {
        def version = params.version.toLong()
        if (emailTemplateInstance.version > version) {

          emailTemplateInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'emailTemplate.label', default: 'EmailTemplate')] as Object[], "Another user has updated this EmailTemplate while you were editing")
          render(view: "edit", model: [emailTemplateInstance: emailTemplateInstance])
          return
        }
      }
      emailTemplateInstance.properties = params
      if (!emailTemplateInstance.hasErrors() && emailTemplateInstance.save(flush: true)) {
        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'emailTemplate.label', default: 'EmailTemplate'), emailTemplateInstance.id])}"
        redirect(action: "edit", id: emailTemplateInstance.id)
      }
      else {
        render(view: "edit", model: [emailTemplateInstance: emailTemplateInstance])
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'emailTemplate.label', default: 'EmailTemplate'), params.id])}"
      redirect(action: "list")
    }
  }

/*
    def show = {
        def emailTemplateInstance = EmailTemplate.get(params.id)
        if (!emailTemplateInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'emailTemplate.label', default: 'EmailTemplate'), params.id])}"
            redirect(action: "list")
        }
        else {
            [emailTemplateInstance: emailTemplateInstance]
        }
    }

    def delete = {
        def emailTemplateInstance = EmailTemplate.get(params.id)
        if (emailTemplateInstance) {
            try {
                emailTemplateInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'emailTemplate.label', default: 'EmailTemplate'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'emailTemplate.label', default: 'EmailTemplate'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'emailTemplate.label', default: 'EmailTemplate'), params.id])}"
            redirect(action: "list")
        }
    }
    */
}
