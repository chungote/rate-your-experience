package security

import participant.Agent
import participant.Broker
import participant.ServiceProvider
import system.TermsOfService

/**
 * User domain class.
 */
class Person {
    static transients = ['pass']
    static hasMany = [authorities: Role]
    static belongsTo = Role

    /** Username      */
    String username
    /** User Real Name     */
    String userRealName
    /** MD5 Password      */
    String passwd
    /** enabled      */
    boolean enabled = true

    String email
    String type
    boolean emailShow

    Boolean optIn = true

    Integer termsOfServiceId

    /** description      */
    String description = ''

    /** plain password to create a MD5 password      */
    String pass = '[secret]'

    Integer participantId


    static constraints = {
        username(blank: false, unique: true)
        passwd(blank: false)
        userRealName(blank: false)
        type(inList: ["admin", "agent", "broker", "provider"])
        description()
        email()
        emailShow()
        enabled()
        optIn()
        termsOfServiceId(maxSize: 5, nullable: true)
        participantId(maxSize: 20, nullable: true)

    }


    def getParticipant() {
        switch (type) {
            case "admin":
                return null //Admin.get(participantId)
                break

            case "agent":
                return Agent.get(participantId)
                break

            case "broker":
                return Broker.get(participantId)
                break

            case "provider":
                return ServiceProvider.get(participantId)
                break

        }

    }

    def getCurrentTOS() {
        switch (type) {
            case "admin":
                return null //Admin.get(participantId)
                break

            case "agent":
                def crit = TermsOfService.createCriteria()
                def tos = new TermsOfService()
                def results = crit {
                    eq("type", "agent")
                    order("dateCreated", "desc")
                }
                tos = results[0]
                return tos
                break

            case "broker":
                def crit = TermsOfService.createCriteria()
                def tos = new TermsOfService()
                def results = crit {
                    eq("type", "broker")
                    order("dateCreated", "desc")
                }
                tos = results[0]
                return tos

                break

            case "provider":
                def crit = TermsOfService.createCriteria()
                def tos = new TermsOfService()
                def results = crit {
                    eq("type", "provider")
                    order("dateCreated", "desc")
                }
                tos = results[0]
                return tos

                break

        }

    }

    Boolean isTOSCurrent() {
        //println "checking TOS"
        switch (type) {
            case "admin":
                return true //Admin.get(participantId)
                break

            default:
                //println "tos id is $termsOfServiceId"
                TermsOfService myTOS = TermsOfService.get(termsOfServiceId)
                if (myTOS == null) {
                    //println "no TOS"
                    return false
                }
                if (myTOS == getCurrentTOS()) {
                    //println "TOS current"
                    return true
                } else {
                    //println "TOS out of date"
                    return false
                }

                break

        }

    }


    String toString() {
        return "$username"
    }
}
