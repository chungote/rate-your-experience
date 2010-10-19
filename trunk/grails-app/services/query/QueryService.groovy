package query

import participant.ServiceProvider

class QueryService {
    boolean transactional = false

    def sessionFactory

    def findBrokerQuery(type, params, bind) {

        def queryString

        def dateCriteria = ""
        if (params.beginDate && params.endDate) {
            dateCriteria = "and n.survey_completed_date between ? and ?"
        }
        else if (params.beginDate) {
            dateCriteria = "and n.survey_completed_date >= ?"
        }
        else if (params.endDate) {
            dateCriteria = "and n.survey_completed_date <= ?"
        }

        def questionTypeCriteria = ""

        if (params.questionType) {
            questionTypeCriteria = "and q.header = ?"
        }

        switch (type.toLowerCase()) {

            case 'agent':
                queryString = """
select ${bind.func}(qr.rating) as rating, b.id as bid, a.id as id
from
    notification n,
    retransaction t,
    listing l,
    agent a,
    broker b,
    question_response qr,
    question_group qg,
    survey_response_question_response srq,
    question q
where
    n.transaction_id=t.id
    and t.listing_id=l.id
    and l.selling_agent_mls_id=a.mls_agent_id
    and b.mls_main_office_id=a.mls_main_office_id
    and n.survey_response_id=srq.survey_response_responses_id
    and srq.question_response_id=qr.id
    and qr.question_id=q.id
    and q.group_id=qg.id
    and q.rateable='1'
    and qr.rating is not null
    and qr.rating >0
    and qg.type='agent'
    ${dateCriteria}
    ${questionTypeCriteria}

group by b.id, a.id
"""
println "query string for agents" +queryString
                break;
            case 'all providers':
            case '':
            case null:
                queryString = """
select ${bind.func}(qr.rating) as rating, b.id as bid, n.transaction_id as id
from
survey_invitation_request sir,
question_response qr,
question q,
question_group qg,
notification n,
survey_response_question_response srqr,
broker b,
listing l,
agent a,
retransaction t
where
n.transaction_id=t.id
and t.listing_id=l.id
and l.selling_agent_mls_id=a.mls_agent_id
and b.mls_main_office_id=a.mls_main_office_id
and n.survey_invitation_request_id=sir.id
and n.survey_response_id=srqr.survey_response_responses_id
and srqr.question_response_id=qr.id
and qr.question_id=q.id
and qg.id=q.group_id
and qg.type not in ('agent','demographics')
    and q.rateable='1'
    and qr.rating is not null
    and qr.rating >0
    ${dateCriteria}
    ${questionTypeCriteria}
group by b.id, qg.type
"""
                break;
            case 'house inspector':
                queryString = """
select ${bind.func}(qr.rating) as rating, b.id as bid, sir.house_inspector_id as id
from
survey_invitation_request sir,
question_response qr,
question q,
question_group qg,
notification n,
survey_response_question_response srqr,
broker b,
listing l,
agent a,
retransaction t
where
n.transaction_id=t.id
and t.listing_id=l.id
and l.selling_agent_mls_id=a.mls_agent_id
and b.mls_main_office_id=a.mls_main_office_id
and n.survey_invitation_request_id=sir.id
and n.survey_response_id=srqr.survey_response_responses_id
and srqr.question_response_id=qr.id
and qr.question_id=q.id
and qg.id=q.group_id
and qg.type='house inspector'
        and q.rateable='1'
    and qr.rating is not null
    and qr.rating >0
    ${dateCriteria}
    ${questionTypeCriteria}
group by b.id, sir.house_inspector_id
"""
                break;
            case 'attorney':
                queryString = """
select ${bind.func}(qr.rating) as rating, b.id as bid, sir.attorney_id as id
from
survey_invitation_request sir,
question_response qr,
question q,
question_group qg,
notification n,
survey_response_question_response srqr,
broker b,
listing l,
agent a,
retransaction t
where
n.transaction_id=t.id
and t.listing_id=l.id
and l.selling_agent_mls_id=a.mls_agent_id
and b.mls_main_office_id=a.mls_main_office_id
and n.survey_invitation_request_id=sir.id
and n.survey_response_id=srqr.survey_response_responses_id
and srqr.question_response_id=qr.id
and qr.question_id=q.id
and qg.id=q.group_id
and qg.type='attorney'
    and q.rateable='1'
    and qr.rating is not null
    and qr.rating >0
    ${dateCriteria}
    ${questionTypeCriteria}
group by b.id, sir.attorney_id
"""
                break;
            case 'lender':
                queryString = """
select ${bind.func}(qr.rating) as rating, b.id as bid, sir.lender_id as id
from
survey_invitation_request sir,
question_response qr,
question q,
question_group qg,
notification n,
survey_response_question_response srqr,
broker b,
listing l,
agent a,
retransaction t
where
n.transaction_id=t.id
and t.listing_id=l.id
and l.selling_agent_mls_id=a.mls_agent_id
and b.mls_main_office_id=a.mls_main_office_id
and n.survey_invitation_request_id=sir.id
and n.survey_response_id=srqr.survey_response_responses_id
and srqr.question_response_id=qr.id
and qr.question_id=q.id
and qg.id=q.group_id
and qg.type='lender'
    and q.rateable='1'
    and qr.rating is not null
    and qr.rating >0
    ${dateCriteria}
    ${questionTypeCriteria}
group by b.id, sir.lender_id
"""
                break;
            case 'mold inspector':
                queryString = """
select ${bind.func}(qr.rating) as rating, b.id as bid, sir.mold_inspector_id as id
from
survey_invitation_request sir,
question_response qr,
question q,
question_group qg,
notification n,
survey_response_question_response srqr,
broker b,
listing l,
agent a,
retransaction t
where
n.transaction_id=t.id
and t.listing_id=l.id
and l.selling_agent_mls_id=a.mls_agent_id
and b.mls_main_office_id=a.mls_main_office_id
and n.survey_invitation_request_id=sir.id
and n.survey_response_id=srqr.survey_response_responses_id
and srqr.question_response_id=qr.id
and qr.question_id=q.id
and qg.id=q.group_id
and qg.type='mold inspector'
    and q.rateable='1'
    and qr.rating is not null
    and qr.rating >0
    ${dateCriteria}
    ${questionTypeCriteria}
group by b.id, sir.mold_inspector_id
"""
                break;
            case 'radon inspector':
                queryString = """
select ${bind.func}(qr.rating) as rating, b.id as bid, sir.radon_inspector_id as id
from
survey_invitation_request sir,
question_response qr,
question q,
question_group qg,
notification n,
survey_response_question_response srqr,
broker b,
listing l,
agent a,
retransaction t
where
n.transaction_id=t.id
and t.listing_id=l.id
and l.selling_agent_mls_id=a.mls_agent_id
and b.mls_main_office_id=a.mls_main_office_id
and n.survey_invitation_request_id=sir.id
and n.survey_response_id=srqr.survey_response_responses_id
and srqr.question_response_id=qr.id
and qr.question_id=q.id
and qg.id=q.group_id
and qg.type='radon inspector'
    and q.rateable='1'
    and qr.rating is not null
    and qr.rating >0
    ${dateCriteria}
    ${questionTypeCriteria}
group by b.id, sir.radon_inspector_id
"""
                break;
            case 'termite inspector':
                queryString = """
select ${bind.func}(qr.rating) as rating, b.id as bid, sir.termite_inspector_id as id
from
survey_invitation_request sir,
question_response qr,
question q,
question_group qg,
notification n,
survey_response_question_response srqr,
broker b,
listing l,
agent a,
retransaction t
where
n.transaction_id=t.id
and t.listing_id=l.id
and l.selling_agent_mls_id=a.mls_agent_id
and b.mls_main_office_id=a.mls_main_office_id
and n.survey_invitation_request_id=sir.id
and n.survey_response_id=srqr.survey_response_responses_id
and srqr.question_response_id=qr.id
and qr.question_id=q.id
and qg.id=q.group_id
and qg.type='termite inspector'
    and q.rateable='1'
    and qr.rating is not null
    and qr.rating >0
    ${dateCriteria}
    ${questionTypeCriteria}
group by b.id, sir.termite_inspector_id
"""
                break;
        }
        return queryString
    }

    def findAgentQuery(type, params, bind) {

        def queryString

        def dateCriteria = ""
        if (params.beginDate && params.endDate) {
            dateCriteria = "and n.survey_completed_date between ? and ?"
        }
        else if (params.beginDate) {
            dateCriteria = "and n.survey_completed_date >= ?"
        }
        else if (params.endDate) {
            dateCriteria = "and n.survey_completed_date <= ?"
        }

        def questionTypeCriteria = ""

        if (params.questionType) {
            questionTypeCriteria = "and q.header = ?"
        }

        switch (type.toLowerCase()) {

            case 'agent':
                queryString = """
select ${bind.func}(qr.rating) as rating, a.id as id
from
    notification n,
    retransaction t,
    listing l,
    agent a,
    question_response qr,
    question_group qg,
    survey_response_question_response srq,
    question q
where
    n.transaction_id=t.id
    and t.listing_id=l.id
    and l.selling_agent_mls_id=a.mls_agent_id
    and n.survey_response_id=srq.survey_response_responses_id
    and srq.question_response_id=qr.id
    and qr.question_id=q.id
    and q.group_id=qg.id
    and q.rateable='1'
    and qr.rating is not null
    and qr.rating >0
    and qg.type='agent'
    ${dateCriteria}
    ${questionTypeCriteria}
    and a.id = ?
group by n.survey_response_id
"""
                break;
            case 'all providers':
            case '':
            case null:
                queryString = """
select ${bind.func}(qr.rating) as rating, n.transaction_id as id
from
survey_invitation_request sir,
question_response qr,
question q,
question_group qg,
notification n,
survey_response_question_response srqr,
listing l,
agent a,
retransaction t
where
n.transaction_id=t.id
and t.listing_id=l.id
and l.selling_agent_mls_id=a.mls_agent_id
and n.survey_invitation_request_id=sir.id
and n.survey_response_id=srqr.survey_response_responses_id
and srqr.question_response_id=qr.id
and qr.question_id=q.id
and qg.id=q.group_id
and qg.type not in ('agent','demographics')
    and q.rateable='1'
    and qr.rating is not null
    and qr.rating >0
    ${dateCriteria}
    ${questionTypeCriteria}
    and a.id = ?
group by n.survey_response_id, qg.type
"""
                break;
            case 'house inspector':
                queryString = """
select ${bind.func}(qr.rating) as rating, sir.house_inspector_id as id
from
survey_invitation_request sir,
question_response qr,
question q,
question_group qg,
notification n,
survey_response_question_response srqr,
listing l,
agent a,
retransaction t
where
n.transaction_id=t.id
and t.listing_id=l.id
and l.selling_agent_mls_id=a.mls_agent_id
and n.survey_invitation_request_id=sir.id
and n.survey_response_id=srqr.survey_response_responses_id
and srqr.question_response_id=qr.id
and qr.question_id=q.id
and qg.id=q.group_id
and qg.type='house inspector'
        and q.rateable='1'
    and qr.rating is not null
    and qr.rating >0
    ${dateCriteria}
    ${questionTypeCriteria}
    and a.id = ?
group by n.survey_response_id, sir.house_inspector_id
"""
                break;
            case 'attorney':
                queryString = """
select ${bind.func}(qr.rating) as rating, sir.attorney_id as id
from
survey_invitation_request sir,
question_response qr,
question q,
question_group qg,
notification n,
survey_response_question_response srqr,
listing l,
agent a,
retransaction t
where
n.transaction_id=t.id
and t.listing_id=l.id
and l.selling_agent_mls_id=a.mls_agent_id
and n.survey_invitation_request_id=sir.id
and n.survey_response_id=srqr.survey_response_responses_id
and srqr.question_response_id=qr.id
and qr.question_id=q.id
and qg.id=q.group_id
and qg.type='attorney'
    and q.rateable='1'
    and qr.rating is not null
    and qr.rating >0
    ${dateCriteria}
    ${questionTypeCriteria}
    and a.id = ?
group by n.survey_response_id, sir.attorney_id
"""
                break;
            case 'lender':
                queryString = """
select ${bind.func}(qr.rating) as rating, sir.lender_id as id
from
survey_invitation_request sir,
question_response qr,
question q,
question_group qg,
notification n,
survey_response_question_response srqr,
listing l,
agent a,
retransaction t
where
n.transaction_id=t.id
and t.listing_id=l.id
and l.selling_agent_mls_id=a.mls_agent_id
and n.survey_invitation_request_id=sir.id
and n.survey_response_id=srqr.survey_response_responses_id
and srqr.question_response_id=qr.id
and qr.question_id=q.id
and qg.id=q.group_id
and qg.type='lender'
    and q.rateable='1'
    and qr.rating is not null
    and qr.rating >0
    ${dateCriteria}
    ${questionTypeCriteria}
    and a.id = ?
group by n.survey_response_id, sir.lender_id
"""
                break;
            case 'mold inspector':
                queryString = """
select ${bind.func}(qr.rating) as rating, sir.mold_inspector_id as id
from
survey_invitation_request sir,
question_response qr,
question q,
question_group qg,
notification n,
survey_response_question_response srqr,
listing l,
agent a,
retransaction t
where
n.transaction_id=t.id
and t.listing_id=l.id
and l.selling_agent_mls_id=a.mls_agent_id
and n.survey_invitation_request_id=sir.id
and n.survey_response_id=srqr.survey_response_responses_id
and srqr.question_response_id=qr.id
and qr.question_id=q.id
and qg.id=q.group_id
and qg.type='mold inspector'
    and q.rateable='1'
    and qr.rating is not null
    and qr.rating >0
    ${dateCriteria}
    ${questionTypeCriteria}
    and a.id = ?
group by n.survey_response_id, sir.mold_inspector_id
"""
                break;
            case 'radon inspector':
                queryString = """
select ${bind.func}(qr.rating) as rating, sir.radon_inspector_id as id
from
survey_invitation_request sir,
question_response qr,
question q,
question_group qg,
notification n,
survey_response_question_response srqr,
listing l,
agent a,
retransaction t
where
n.transaction_id=t.id
and t.listing_id=l.id
and l.selling_agent_mls_id=a.mls_agent_id
and n.survey_invitation_request_id=sir.id
and n.survey_response_id=srqr.survey_response_responses_id
and srqr.question_response_id=qr.id
and qr.question_id=q.id
and qg.id=q.group_id
and qg.type='radon inspector'
    and q.rateable='1'
    and qr.rating is not null
    and qr.rating >0
    ${dateCriteria}
    ${questionTypeCriteria}
    and a.id = ?
group by n.survey_response_id, sir.radon_inspector_id
"""
                break;
            case 'termite inspector':
                queryString = """
select ${bind.func}(qr.rating) as rating, sir.termite_inspector_id as id
from
survey_invitation_request sir,
question_response qr,
question q,
question_group qg,
notification n,
survey_response_question_response srqr,
listing l,
agent a,
retransaction t
where
n.transaction_id=t.id
and t.listing_id=l.id
and l.selling_agent_mls_id=a.mls_agent_id
and n.survey_invitation_request_id=sir.id
and n.survey_response_id=srqr.survey_response_responses_id
and srqr.question_response_id=qr.id
and qr.question_id=q.id
and qg.id=q.group_id
and qg.type='termite inspector'
    and q.rateable='1'
    and qr.rating is not null
    and qr.rating >0
    ${dateCriteria}
    ${questionTypeCriteria}
    and a.id = ?
group by n.survey_response_id, sir.termite_inspector_id
"""
                break;
        }
        return queryString
    }

def findProviderQuery(type, params, bind) {

        def queryString

        def dateCriteria = ""
        if (params.beginDate && params.endDate) {
            dateCriteria = "and n.survey_completed_date between ? and ?"
        }
        else if (params.beginDate) {
            dateCriteria = "and n.survey_completed_date >= ?"
        }
        else if (params.endDate) {
            dateCriteria = "and n.survey_completed_date <= ?"
        }

        def questionTypeCriteria = ""

        if (params.questionType) {
            questionTypeCriteria = "and q.header = ?"
        }

        switch (type.toLowerCase()) {

            case 'all providers':
            case '':
            case null:
                queryString = """
select ${bind.func}(qr.rating) as rating, n.transaction_id as id
from
survey_invitation_request sir,
question_response qr,
question q,
question_group qg,
notification n,
survey_response_question_response srqr,
listing l,
agent a,
retransaction t
where
n.transaction_id=t.id
and t.listing_id=l.id
and l.selling_agent_mls_id=a.mls_agent_id
and n.survey_invitation_request_id=sir.id
and n.survey_response_id=srqr.survey_response_responses_id
and srqr.question_response_id=qr.id
and qr.question_id=q.id
and qg.id=q.group_id
and qg.type not in ('agent','demographic')
    and q.rateable='1'
    and qr.rating is not null
    and qr.rating >0
    ${dateCriteria}
    ${questionTypeCriteria}
    and a.id = ?
group by n.survey_response_id, qg.type
"""
                break;
            case 'house inspector':
                queryString = """
select ${bind.func}(qr.rating) as rating, sir.house_inspector_id as id
from
survey_invitation_request sir,
question_response qr,
question q,
question_group qg,
notification n,
survey_response_question_response srqr,
where
n.survey_invitation_request_id=sir.id
and n.survey_response_id=srqr.survey_response_responses_id
and srqr.question_response_id=qr.id
and qr.question_id=q.id
and qg.id=q.group_id
and qg.type='house inspector'
        and q.rateable='1'
    and qr.rating is not null
    and qr.rating >0
    ${dateCriteria}
    ${questionTypeCriteria}
    and sir.house_inspector_id=?
group by n.survey_response_id, sir.house_inspector_id
"""
                break;
            case 'attorney':
                queryString = """
select ${bind.func}(qr.rating) as rating, sir.attorney_id as id
from
survey_invitation_request sir,
question_response qr,
question q,
question_group qg,
notification n,
survey_response_question_response srqr,
where
n.survey_invitation_request_id=sir.id
and n.survey_response_id=srqr.survey_response_responses_id
and srqr.question_response_id=qr.id
and qr.question_id=q.id
and qg.id=q.group_id
and qg.type='attorney'
    and q.rateable='1'
    and qr.rating is not null
    and qr.rating >0
    ${dateCriteria}
    ${questionTypeCriteria}
    and sir.attorney_id = ?
group by n.survey_response_id, sir.attorney_id
"""
                break;
            case 'lender':
                queryString = """
select ${bind.func}(qr.rating) as rating, sir.lender_id as id
from
survey_invitation_request sir,
question_response qr,
question q,
question_group qg,
notification n,
survey_response_question_response srqr,
where
n.survey_invitation_request_id=sir.id
and n.survey_response_id=srqr.survey_response_responses_id
and srqr.question_response_id=qr.id
and qr.question_id=q.id
and qg.id=q.group_id
and qg.type='lender'
    and q.rateable='1'
    and qr.rating is not null
    and qr.rating >0
    ${dateCriteria}
    ${questionTypeCriteria}
    and sir.lender_id = ?
group by n.survey_response_id, sir.lender_id
"""
                break;
            case 'mold inspector':
                queryString = """
select ${bind.func}(qr.rating) as rating, sir.mold_inspector_id as id
from
survey_invitation_request sir,
question_response qr,
question q,
question_group qg,
notification n,
survey_response_question_response srqr,
where
n.survey_invitation_request_id=sir.id
and n.survey_response_id=srqr.survey_response_responses_id
and srqr.question_response_id=qr.id
and qr.question_id=q.id
and qg.id=q.group_id
and qg.type='mold inspector'
    and q.rateable='1'
    and qr.rating is not null
    and qr.rating >0
    ${dateCriteria}
    ${questionTypeCriteria}
    and sir.mold_inspector_id = ?
group by n.survey_response_id, sir.mold_inspector_id
"""
                break;
            case 'radon inspector':
                queryString = """
select ${bind.func}(qr.rating) as rating, sir.radon_inspector_id as id
from
survey_invitation_request sir,
question_response qr,
question q,
question_group qg,
notification n,
survey_response_question_response srqr,
where
n.survey_invitation_request_id=sir.id
and n.survey_response_id=srqr.survey_response_responses_id
and srqr.question_response_id=qr.id
and qr.question_id=q.id
and qg.id=q.group_id
and qg.type='radon inspector'
    and q.rateable='1'
    and qr.rating is not null
    and qr.rating >0
    ${dateCriteria}
    ${questionTypeCriteria}
    and sir.radon_inspector_id = ?
group by n.survey_response_id, sir.radon_inspector_id
"""
                break;
            case 'termite inspector':
                queryString = """
select ${bind.func}(qr.rating) as rating, sir.termite_inspector_id as id
from
survey_invitation_request sir,
question_response qr,
question q,
question_group qg,
notification n,
survey_response_question_response srqr,
where
n.survey_invitation_request_id=sir.id
and n.survey_response_id=srqr.survey_response_responses_id
and srqr.question_response_id=qr.id
and qr.question_id=q.id
and qg.id=q.group_id
and qg.type='termite inspector'
    and q.rateable='1'
    and qr.rating is not null
    and qr.rating >0
    ${dateCriteria}
    ${questionTypeCriteria}
    and sir.termite_inspector_id = ?
group by n.survey_response_id, sir.termite_inspector_id
"""
                break;
        }
        return queryString
    }


    def findAllQuestionTypes(type) {
        def typeCriteria = ""
        if (type && type != "all providers") {
            typeCriteria = "and qg.type=?"
        }
        else {
            type = ""
            typeCriteria = "and qg.type <> 'agent'"
        }
        def queryString = """
        select distinct q.header
        from question q,question_group qg
        where
        q.group_id=qg.id
        and q.rateable = 1
        ${typeCriteria}
        order by q.header asc
        """
        def hSession = sessionFactory.getCurrentSession()
        def query = hSession.createSQLQuery(queryString).
                addScalar("header")
        if (type) {
            query.setString(0, type)
        }
        println "find all question types query" +queryString

        return query.list().findAll {it} // skip nulls

    }

    def findAllServiceProviderTypes() {
        return ServiceProvider.TYPES.findAll { it != 'broker' && it != 'agent'}
    }
}
