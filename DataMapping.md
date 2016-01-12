# Mapping Data from RETS to RYE #


## Important RYE Fields ##

The following fields in the RYE database are integral to the functioning of the system and found at every MLS (although sometimes under other names).
### Listing ###
•	Selling\_agent\_mls\_id – the mls identifier for the buyer’s primary agent (foreign key is agent.mls\_agent\_id)
•	Selling\_office\_mls\_id – the mls identifier for the buyer’s primary  agent’s office (foreign key is agent.mls\_office\_id)
•	Listing\_agent\_mls\_id – the mls identifier for the primary  listing agent (foreign key is agent.mls\_agent\_id)
•	Listing\_office\_mls\_id – the mls identifier for the primary  listing agent’s office (foreign key is agent.mls\_office\_id)
•	Mls\_number – the mls identifier for a listing

### Agent ###
•	Mls\_agent\_id – the mls identifier for this agent
•	mls\_office\_id – the mls identifier for the agent’s office (foreign key to office.mls\_office\_id)
•	mls\_main\_office\_id – the mls identifier for the main office that all branches belong to (foreign key to broker.mls\_main\_office\_id)

### Office ###
•	Mls\_office\_id – the mls identifier for this office
•	mls\_main\_office\_id – the mls identifier for the main office that all branches belong to (foreign key to broker.mls\_main\_office\_id)

### Broker ###
•	mls\_main\_office\_id – the mls identifier for the main office that all branches belong to. A broker is identified by a mls\_main\_office\_id

### Person ###
•	Participant\_id  and Type – where type = “broker” participant\_id is broker.id; where type=”agent”, participant\_id = agent.id, where type=”provider” participant\_id=service\_provider.id

Currently, there is no standard set of RETS fields that is consistent across MLS’s.  In order to facilitate RETS to RYE mapping, we’ve provided a sample Listing, Agent and Office mapping project that can be edited in Talend Open Studio.

## Talend Open Studio ##
Talend is a GUI open source mapping tool.  It requires Java.  [Download](http://www.talend.com/download.php)version 3.x or later and then unzip.

Launch Talend. Under the Project dropdown, select “import existing project as local” and click GO.

In the “import” dialogue, name your project “rye”.  Click the “select archive file” radio button. Browse to RateYourExperience\talend\rye\_sample.zip. Click “finish”.
You can edit the sample jobs to use your RETS files.

For detailed instructions on using Talend, [download](http://www.talend.com/resources/documentation.php)the user guide.