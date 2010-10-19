package transaction

import participant.Agent
import participant.Office

class Listing {
  String mlsNumber
  Date listDate
  Date closedDate
  Integer listPrice
  Integer soldPrice
  String streetAddress
  String unitNumber
  String lotNumber
  String city
  String zip
  String stateOrProvince
  String county
  String area
  String listingAgentMlsId
  String listingOfficeMlsId
  String sellingAgentMlsId
  String sellingOfficeMlsId
  String buyerAgentMlsId
  String buyerOfficeMlsId
  Integer beds
  Integer bathsFull
  Integer bathsHalf
  Integer bathsTotal
  Integer rooms
  String yearBuilt
  String style
  String schoolDistrict
  String propertyType
  String propertySubType
  String acres
  String lotSize
  String squareFeet
  String subdivision

static mapping = {
	listingAgentMlsId index:'listing_agent_mls_idx'
	listingOfficeMlsId index:'listing_office_mls_idx'
	sellingAgentMlsId index:'selling_agent_mls_idx'
	sellingOfficeMlsId index:'selling_office_mls_idx'
	soldPrice index:'sold_price_idx'
	closedDate index:'closed_date_idx'


}



  static constraints = {

    mlsNumber(maxSize: 20)
    listDate(nullable: true)
    closedDate(nullable: true)
    listPrice(max: Integer.MAX_VALUE, nullable: true)
    soldPrice(max: Integer.MAX_VALUE, nullable: true)
    streetAddress(maxSize: 100, nullable: true)
    unitNumber(maxSize: 20, nullable: true)
    lotNumber(maxSize: 20, nullable: true)
    city(maxSize: 100, nullable: true)
    zip(maxSize: 20, nullable: true)
    stateOrProvince(maxSize: 50, nullable: true)
    county(maxSize: 100, nullable: true)
    area(maxSize: 100, nullable: true)
    listingAgentMlsId(maxSize: 25, nullable: true)
    listingOfficeMlsId(maxSize: 25, nullable: true)
    sellingAgentMlsId(maxSize: 25, nullable: true)
    sellingOfficeMlsId(maxSize: 25, nullable: true)
    buyerAgentMlsId(maxSize: 25, nullable: true)
    buyerOfficeMlsId(maxSize: 25, nullable: true)
    beds(max: 999999, nullable: true)
    bathsFull(max: 999999, nullable: true)
    bathsHalf(max: 999999, nullable: true)
    bathsTotal(max: 999999, nullable: true)
    rooms(max: 999999, nullable: true)
    yearBuilt(maxSize: 255, nullable: true)
    style(maxSize: 200, nullable: true)
    schoolDistrict(maxSize: 100, nullable: true)
    propertyType(maxSize: 100, nullable: true)
    propertySubType(maxSize: 100, nullable: true)
    acres(maxSize: 20, nullable: true)
    lotSize(maxSize: 25, nullable: true)
    squareFeet(maxSize: 25, nullable: true)
    subdivision(maxSize: 100, nullable: true)
  }

  Date dateCreated
  Date lastUpdated

  String toString() {
    "${mlsNumber}:${streetAddress}, ${city}"
  }

  static transients = [
          "listingAgent",
          "sellingAgent",
          "buyerAgent",
          "listingOffice",
          "sellingOffice",
          "buyerOffice",
          "sellingBroker",
          "buyerBroker",
          "transaction",
          "responses"
  ]

  def getListingAgent() {
    if (listingAgentMlsId) {
      return Agent.findByMlsAgentId(listingAgentMlsId)
    } else {
      return null
    }
  }

  def getListingOffice() {
    if (listingOfficeMlsId) {
      return Office.findByMlsOfficeId(listingOfficeMlsId)
    } else {
      return null
    }
  }

  def getSellingAgent() {
    if (sellingAgentMlsId) {
      return Agent.findByMlsAgentId(sellingAgentMlsId)
    } else {
      return null
    }
  }

  def getSellingOffice() {
    if (sellingOfficeMlsId) {
      return Office.findByMlsOfficeId(sellingOfficeMlsId)
    } else {
      return null
    }
  }

  def getBuyerAgent() {
    if (buyerAgentMlsId) {
      return Agent.findByMlsAgentId(buyerAgentMlsId)
    } else {
      return null
    }
  }

  def getBuyerOffice() {
    if (buyerOfficeMlsId) {
      return Office.findByMlsOfficeId(buyerOfficeMlsId)
    } else {
      return null
    }
  }

  def getSellingBroker() {
    sellingAgent.broker
  }

  def getBuyerBroker() {
    buyingAgent.broker
  }

  def getTransaction() {
    RETransaction.findAllByListing(this)
  }

  def getResponses() {
    transaction?.notification?.surveyResponse.flatten().findAll {it}
  }

}
