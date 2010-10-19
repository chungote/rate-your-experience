import grails.util.GrailsUtil
import survey.*
import org.grails.plugins.springsecurity.service.AuthenticateService
import security.*

class BootStrap {

    AuthenticateService authenticateService

    def init = {servletContext ->

        initAdmin()

        addDevData()

    }

    private def addDevData() {
        switch (GrailsUtil.environment) {
            case 'development':
                for (int h in 1..1) {
                    def survey = new Survey(
                            name: "S$h",
                            welcome: "hi-$h",
                            thankYou: "bye-$h"
                    )

                    for (int i in 1..4) {
                        def g = new QuestionGroup(
                                sortOrder: i,
                                name: "G$i",
                                description: "Grp $i"
                        )
                        for (int j in 1..4) {
                            def q = new Question(
                                    sortOrder: j,
                                    text: "Question #$i.$j",
                                    rateable: true,
                                    required: true
                            )
                            for (int k in 1..3) {
                                def a = new Answer(
                                        sortOrder: k,
                                        text: "Answer #$i.$j.$k"
                                )
                                q.addToAnswers(a)
                            }
                            g.addToQuestions(q)
                        }
                        survey.addToGroups(g)
                    }
                    survey.save()
                    if (survey.hasErrors()) {
                        println survey.errors
                    }
                }

                def survey = new Survey(
                        name: "Your Experience With Your REALTOR&reg; Joe Smith",
                        welcome: "Welcome to Rate Your Experience.  Your opinions matter to us - with your help, we want to improve the home buying and selling experience for everyone.  Please fill out the following survey about your REALTOR&reg; Joe Smith.",
                        thankYou: "Thank you for rating your experience with Joe Smith."
                )


                def g, q, a
                g = new QuestionGroup(
                        sortOrder: 1,
                        name: "Demographics",
                        description: ""
                )
                q = new Question(
                        sortOrder: 1,
                        text: "Age range",
                        rateable: false,
                        required: false,
                        questionType: "SINGLE_CHOICE"
                )
                a = new Answer(
                        sortOrder: 1,
                        text: "<24"
                )
                q.addToAnswers(a)
                a = new Answer(
                        sortOrder: 2,
                        text: "25-34"
                )
                q.addToAnswers(a)
                a = new Answer(
                        sortOrder: 3,
                        text: "35-44"
                )
                q.addToAnswers(a)
                a = new Answer(
                        sortOrder: 4,
                        text: "45-54"
                )
                q.addToAnswers(a)
                a = new Answer(
                        sortOrder: 5,
                        text: "55 and over"
                )
                q.addToAnswers(a)

                g.addToQuestions(q)

                q = new Question(
                        sortOrder: 2,
                        text: "Home Ownership Type",
                        rateable: false,
                        required: false,
                        questionType: "SINGLE_CHOICE"
                )
                a = new Answer(
                        sortOrder: 1,
                        text: "First Time Home Buyer"
                )
                q.addToAnswers(a)
                a = new Answer(
                        sortOrder: 2,
                        text: "Repeat Home Buyer - Primary Home"
                )
                q.addToAnswers(a)
                a = new Answer(
                        sortOrder: 3,
                        text: "Secondary Home"
                )
                q.addToAnswers(a)
                a = new Answer(
                        sortOrder: 4,
                        text: "Investment Income"
                )
                q.addToAnswers(a)
                g.addToQuestions(q)
                survey.addToGroups(g)
/*
 */
                g = new QuestionGroup(
                        sortOrder: 2,
                        name: "Your Experience",
                        description: "Your Experience"
                )

                q = new Question(
                        sortOrder: 1,
                        header: "Competency",
                        rateable: true,
                        required: true,
                        text: "Explained the process clearly, ensured that paperwork was completed properly, used technology efficiently",
                        questionType: "TEXTFIELD",
                        textFieldSize: 140
                )
                a = new Answer(
                        sortOrder: 1,
                        text: ""
                )
                q.addToAnswers(a)

                g.addToQuestions(q)

                q = new Question(
                        sortOrder: 2,
                        header: "Negotiation",
                        rateable: true,
                        required: true,
                        text: "Negotiated effectively, exhibited attention to detail, represented and protected my interests",
                        questionType: "TEXTFIELD",
                        textFieldSize: 140
                )
                a = new Answer(
                        sortOrder: 1,
                        text: ""
                )
                q.addToAnswers(a)

                g.addToQuestions(q)

                q = new Question(
                        sortOrder: 3,
                        header: "Market Knowledge",
                        rateable: true,
                        required: true,
                        text: "Exhibited knowledge of the real estate market, the neighborhood and community, provided Comparative Market Analysis data, property history info and statistics",
                        questionType: "TEXTFIELD",
                        textFieldSize: 140
                )
                a = new Answer(
                        sortOrder: 1,
                        text: ""
                )
                q.addToAnswers(a)

                g.addToQuestions(q)
                q = new Question(
                        sortOrder: 4,
                        header: "Communication",
                        rateable: true,
                        required: true,
                        text: "Updated me regularly, responded in a timely manner, communicated with me the way I wanted",
                        questionType: "TEXTFIELD",
                        textFieldSize: 140
                )
                a = new Answer(
                        sortOrder: 1,
                        text: ""
                )
                q.addToAnswers(a)

                g.addToQuestions(q)

                q = new Question(
                        sortOrder: 5,
                        header: "My Experience",
                        rateable: true,
                        required: true,
                        text: "Understood my needs, gave me personal attention, made me feel valued as a client, was on time and prompt",
                        questionType: "TEXTFIELD",
                        textFieldSize: 140
                )
                a = new Answer(
                        sortOrder: 1,
                        text: ""
                )
                q.addToAnswers(a)

                g.addToQuestions(q)
                q = new Question(
                        sortOrder: 6,
                        text: "How Likely Would You Be to Recommend <i>Joe Smith</i> to Your Friends or Family",
                        questionType: "TEXTFIELD",
                        rateable: true,
                        required: true,
                        help: "",
                        textFieldSize: 140
                )
                a = new Answer(
                        sortOrder: 1,
                        text: ""
                )
                q.addToAnswers(a)

                g.addToQuestions(q)

                q = new Question(
                        sortOrder: 7,
                        header: "Comments",
                        rateable: true,
                        required: true,
                        text: "",
                        questionType: "TEXTFIELD",
                        textFieldSize: 140

                )
                a = new Answer(
                        sortOrder: 1,
                        text: ""
                )
                q.addToAnswers(a)

                g.addToQuestions(q)

                survey.addToGroups(g)

                survey.save()
                if (survey.hasErrors()) {
                    println survey.errors
                }


                break;
            case 'production':
                break;
        }
    }

    def destroy = {
    }


    void initAdmin() {
        def r

        // add admin role
        if (!Role.findByAuthority("ROLE_ADMIN")) {
            r = new Role(authority: "ROLE_ADMIN", description: "administrator").save()
            log.info "added role: $r.authority"
        }

       /*
       // add user role
        if (!Role.findByAuthority("ROLE_USER")) {
            r = new Role(authority: "ROLE_USER", description: "user").save()
            log.info "added role: $r.authority"
        }
*/
        // add broker role
        if (!Role.findByAuthority("ROLE_BROKER")) {
            r = new Role(authority: "ROLE_BROKER", description: "broker").save()
            log.info "added role: $r.authority"
        }

        // add user role
        if (!Role.findByAuthority("ROLE_AGENT")) {
            r = new Role(authority: "ROLE_AGENT", description: "agent").save()
            log.info "added role: $r.authority"
        }

           if (!Role.findByAuthority("ROLE_PROVIDER")) {
		            r = new Role(authority: "ROLE_PROVIDER", description: "provider").save()
		            log.info "added role: $r.authority"
        }

        // add admin user if no one has that role
        r = Role.findByAuthority("ROLE_ADMIN")
        log.info "Admin user list: $r.people"

        if (r.people == null || r.people.size() == 0) {
            def u = new Person(username: 'admin', userRealName: 'admin', passwd: authenticateService.passwordEncoder('admin'), type:"admin", email: "", enabled: true)
            log.info "created user: $u.username"

//			u.save()
//			log.info "saved user: $u.username"

            r.addToPeople(u).save(flush: true)

            log.info "added user: $u.username"
        }
    }
}