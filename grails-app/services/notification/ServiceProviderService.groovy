package notification

class ServiceProviderService {

    boolean transactional = false

    def correctServiceProviderTypes(SurveyInvitationRequest sir) {
        if (sir?.lender?.type == "not defined") {
            sir.lender.type = "lender"
        }
        if (sir?.houseInspector?.type == "not defined") {
            sir.houseInspector.type = "house inspector"
        }
        if (sir?.moldInspector?.type == "not defined") {
            sir.moldInspector.type = "mold inspector"
        }
        if (sir?.radonInspector?.type == "not defined") {
            sir.radonInspector.type = "radon inspector"
        }
        if (sir?.termiteInspector?.type == "not defined") {
            sir.termiteInspector.type = "termite inspector"
        }
        if (sir?.attorney?.type == "not defined") {
            sir.attorney.type = "attorney"
        }
    }
}
