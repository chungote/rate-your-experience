package system

import security.Person

class PrivacyPolicyController {

  def authenticateService

  static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

  def index = {
    redirect(action: "list", params: params)
  }

  def list = {
    if (!authenticateService.ifAnyGranted("ROLE_ADMIN")){
	        flash.message = "You do not have authorization to access this information"
   }
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    [privacyPolicyInstanceList: PrivacyPolicy.list(params), privacyPolicyInstanceTotal: PrivacyPolicy.count()]
  }

  def create = {
	if (!authenticateService.ifAnyGranted("ROLE_ADMIN")){
	        redirect(action: "list", params:params)
   }
    def privacyPolicyInstance = new PrivacyPolicy()
    privacyPolicyInstance.properties = params
    return [privacyPolicyInstance: privacyPolicyInstance]
  }

  def save = {
    if (!authenticateService.ifAnyGranted("ROLE_ADMIN")){
	        redirect(action: "list", params:params)
   }
    def privacyPolicyInstance = new PrivacyPolicy(params)
    Person user = authenticateService.userDomain()
    privacyPolicyInstance.modifiedBy = user
    if (privacyPolicyInstance.save(flush: true)) {
      flash.message = "${message(code: 'default.created.message', args: [message(code: 'privacyPolicy.label', default: 'PrivacyPolicy'), privacyPolicyInstance.id])}"
      redirect(action: "edit", id: privacyPolicyInstance.id)
    }
    else {
      render(view: "create", model: [privacyPolicyInstance: privacyPolicyInstance])
    }
  }

  def show = {

    def privacyPolicyInstance = PrivacyPolicy.get(params.id)
    if (!privacyPolicyInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'privacyPolicy.label', default: 'PrivacyPolicy'), params.id])}"
      redirect(action: "list")
    }
    else {
      [privacyPolicyInstance: privacyPolicyInstance]
    }
  }

def showCurrent = {

    def privacyPolicyInstanceList=PrivacyPolicy.list(sort: "dateCreated", order: "desc")

      [privacyPolicyInstance: privacyPolicyInstanceList[0]]

  }

  def edit = {
    if (!authenticateService.ifAnyGranted("ROLE_ADMIN")){
	        redirect(action: "list", params:params)
   }
    def privacyPolicyInstance = PrivacyPolicy.get(params.id)
    if (!privacyPolicyInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'privacyPolicy.label', default: 'PrivacyPolicy'), params.id])}"
      redirect(action: "list")
    }
    else {
      return [privacyPolicyInstance: privacyPolicyInstance]
    }
  }

  def update = {
    if (!authenticateService.ifAnyGranted("ROLE_ADMIN")){
	        redirect(action: "list", params:params)
   }
    def privacyPolicyInstance = PrivacyPolicy.get(params.id)
    Person user = authenticateService.userDomain()
    privacyPolicyInstance.modifiedBy = user
    if (privacyPolicyInstance) {
      if (params.version) {
        def version = params.version.toLong()
        if (privacyPolicyInstance.version > version) {

          privacyPolicyInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'privacyPolicy.label', default: 'PrivacyPolicy')] as Object[], "Another user has updated this PrivacyPolicy while you were editing")
          render(view: "edit", model: [privacyPolicyInstance: privacyPolicyInstance])
          return
        }
      }
      privacyPolicyInstance.properties = params
      if (!privacyPolicyInstance.hasErrors() && privacyPolicyInstance.save(flush: true)) {
        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'privacyPolicy.label', default: 'PrivacyPolicy'), privacyPolicyInstance.id])}"
        redirect(action: "edit", id: privacyPolicyInstance.id)
      }
      else {
        render(view: "edit", model: [privacyPolicyInstance: privacyPolicyInstance])
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'privacyPolicy.label', default: 'PrivacyPolicy'), params.id])}"
      redirect(action: "list")
    }
  }
/*
  def delete = {
    if (!authenticateService.ifAnyGranted("ROLE_ADMIN")){
	        redirect(action: "list", params:params)
   }
    def privacyPolicyInstance = PrivacyPolicy.get(params.id)
    if (privacyPolicyInstance) {
      try {
        privacyPolicyInstance.delete(flush: true)
        flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'privacyPolicy.label', default: 'PrivacyPolicy'), params.id])}"
        redirect(action: "list")
      }
      catch (org.springframework.dao.DataIntegrityViolationException e) {
        flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'privacyPolicy.label', default: 'PrivacyPolicy'), params.id])}"
        redirect(action: "show", id: params.id)
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'privacyPolicy.label', default: 'PrivacyPolicy'), params.id])}"
      redirect(action: "list")
    }
  }
  */

}
