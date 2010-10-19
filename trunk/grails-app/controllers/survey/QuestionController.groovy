package survey

class QuestionController {

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
	          flash.message="You are not authorized to access this information"
   }
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    [questionInstanceList: Question.list(params), questionInstanceTotal: Question.count()]
  }

  def create = {
     if (!authenticateService.ifAnyGranted("ROLE_ADMIN")){
	        redirect(action: "list", params:params)
   }
    def questionInstance = new Question()
    questionInstance.properties = params
    return [questionInstance: questionInstance]
  }

  def addQuestion = {
     if (!authenticateService.ifAnyGranted("ROLE_ADMIN")){
	        redirect(action: "list", params:params)
   }
    println "in add question"
    //render "new question code is here"
    def questionInstance = new Question()
    questionInstance.sortOrder = (params.size?.toInteger()) ?: 0

    render(template: "/question/addQuestion",
            model: ['questionInstance': questionInstance, 'prefix': params.prefix])
  }

  def save = {
     if (!authenticateService.ifAnyGranted("ROLE_ADMIN")){
	        redirect(action: "list", params:params)
   }
    def questionInstance = new Question(params)
    if (questionInstance.save(flush: true)) {
      flash.message = "${message(code: 'default.created.message', args: [message(code: 'question.label', default: 'Question'), questionInstance.id])}"
      redirect(action: "show", id: questionInstance.id)
    }
    else {
      render(view: "create", model: [questionInstance: questionInstance])
    }
  }

  def show = {
    def questionInstance = Question.get(params.id)
    if (!questionInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), params.id])}"
      redirect(action: "list")
    }
    else {
      [questionInstance: questionInstance]
    }
  }

  def edit = {
     if (!authenticateService.ifAnyGranted("ROLE_ADMIN")){
	        redirect(action: "list", params:params)
   }
    def questionInstance = Question.get(params.id)
    if (!questionInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), params.id])}"
      redirect(action: "list")
    }
    else {
      return [questionInstance: questionInstance]
    }
  }

  def update = {
     if (!authenticateService.ifAnyGranted("ROLE_ADMIN")){
	        redirect(action: "list", params:params)
   }
    def questionInstance = Question.get(params.id)
    if (questionInstance) {
      if (params.version) {
        def version = params.version.toLong()
        if (questionInstance.version > version) {

          questionInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'question.label', default: 'Question')] as Object[], "Another user has updated this Question while you were editing")
          render(view: "edit", model: [questionInstance: questionInstance])
          return
        }
      }
      questionInstance.properties = params
      if (!questionInstance.hasErrors() && questionInstance.save(flush: true)) {
        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'question.label', default: 'Question'), questionInstance.id])}"
        redirect(action: "show", id: questionInstance.id)
      }
      else {
        render(view: "edit", model: [questionInstance: questionInstance])
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), params.id])}"
      redirect(action: "list")
    }
  }

  def delete = {
     if (!authenticateService.ifAnyGranted("ROLE_ADMIN")){
	        redirect(action: "list", params:params)
   }
    def questionInstance = Question.get(params.id)
    if (questionInstance) {
      try {
        questionInstance.delete(flush: true)
        flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'question.label', default: 'Question'), params.id])}"
        redirect(action: "list")
      }
      catch (org.springframework.dao.DataIntegrityViolationException e) {
        flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'question.label', default: 'Question'), params.id])}"
        redirect(action: "show", id: params.id)
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), params.id])}"
      redirect(action: "list")
    }
  }
}
