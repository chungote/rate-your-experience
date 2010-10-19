package filter

class SimpleProfanityFilterService {

    boolean transactional = false

     def evaluateContents(String contents) {



	      def base = "http://ws.cdyne.com/ProfanityWS/Profanity.asmx/SimpleProfanityFilter"
	      def url = new URL(base)
	      def connection = url.openConnection()
		  connection.requestMethod = 'POST'
		  connection.doOutput="true"
		  connection.outputStream.withWriter("ASCII") {
			  it << "Text=${contents}"
		  }

	      def result = [:]
	      result.originalText=contents

	      if(connection.responseCode == connection.HTTP_OK){
	        def FilterReturn = new XmlSlurper().parse(connection.inputStream)

	        result.isProfanity = FilterReturn.FoundProfanity as Boolean
	        result.cleanText = FilterReturn.CleanText as String
	        result.error=false

	      }
	      else{
	        log.error("SimpleProfanityService.evaluateContents FAILED")
	        log.error(url)
	        log.error(connection.responseCode)
	        log.error(connection.responseMessage)
	        result.error=true
	      }
	      return result
	    }

}
