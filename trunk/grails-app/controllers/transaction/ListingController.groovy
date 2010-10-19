package transaction

import participant.Agent
import participant.Broker

class ListingController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [listingInstanceList: Listing.list(params), listingInstanceTotal: Listing.count()]
    }

    def report = {
        if (!params.max) params.max = 10
        [listingInstanceList: Listing.findAllBySellingAgentMlsId(params.id), listingInstanceTotal: Listing.count(), agentInstance: Agent.findByMlsAgentId(params.id)]
    }

    def brokerReport = {
        if (!params.max) params.max = 10
        [listingInstanceList: Broker.get(params.id).sellerListings, listingInstanceTotal: Listing.count(), brokerInstance: Broker.get(params.id)]

    }

/*
    def create = {
        def listingInstance = new Listing()
        listingInstance.properties = params
        return [listingInstance: listingInstance]
    }

    def save = {
        def listingInstance = new Listing(params)
        if (listingInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'listing.label', default: 'Listing'), listingInstance.id])}"
            redirect(action: "show", id: listingInstance.id)
        }
        else {
            render(view: "create", model: [listingInstance: listingInstance])
        }
    }

    def show = {
        def listingInstance = Listing.get(params.id)
        if (!listingInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'listing.label', default: 'Listing'), params.id])}"
            redirect(action: "list")
        }
        else {
            [listingInstance: listingInstance]
        }
    }

    def edit = {
        def listingInstance = Listing.get(params.id)
        if (!listingInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'listing.label', default: 'Listing'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [listingInstance: listingInstance]
        }
    }

    def update = {
        def listingInstance = Listing.get(params.id)
        if (listingInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (listingInstance.version > version) {

                    listingInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'listing.label', default: 'Listing')] as Object[], "Another user has updated this Listing while you were editing")
                    render(view: "edit", model: [listingInstance: listingInstance])
                    return
                }
            }
            listingInstance.properties = params
            if (!listingInstance.hasErrors() && listingInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'listing.label', default: 'Listing'), listingInstance.id])}"
                redirect(action: "show", id: listingInstance.id)
            }
            else {
                render(view: "edit", model: [listingInstance: listingInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'listing.label', default: 'Listing'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def listingInstance = Listing.get(params.id)
        if (listingInstance) {
            try {
                listingInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'listing.label', default: 'Listing'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'listing.label', default: 'Listing'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'listing.label', default: 'Listing'), params.id])}"
            redirect(action: "list")
        }
    }
    */
}
