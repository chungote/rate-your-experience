# RETS Client #

Rate Your Experience comes with a simple RETS download client called Greta.  If you do not wish to use this client, you may substitute a RETS client of your choosing.

## Configure RETS Login ##

Navigate to the RateYourExperience\greta\bin directory and use a text editor to open the GretaDefaults.greta file.  Edit the loginURL and retsVersion properties to use those supplied by your MLS Vendor for the RETS server you are connecting to.  If you have been supplied with a user-agent, replace the default “greta/1.0” user-agent property with your user-agent.

Open the Greta.greta file with a text editor.  Edit the retsLogin property to use the username and password supplied by your RETS vendor.

## Retrieve RETS Metadata ##
Now you want to tell the system to retrieve metadata.  Edit the run.default property and uncomment ‘metadataAll’. (remove the \\)
Go to a command prompt.  Navigate to RateYourExperience\greta\bin. Type “greta” and hit enter.  Greta will retrieve RETS metadata as a tab-delimited file.  When the job has finished running, you will have a file in this directory called “METADATA-SYSTEM-COMPACT.txt”.

## Configure RETS Sold Listing, Office and Agent Download ##
In GretaDefaults.greta, the following jobs are predefined:
•	downloadResidentialPropertySoldListings
•	downloadCondoSoldListings
•	 downloadLotsAndLandSoldListings
•	downloadMultiFamilySoldListings
•	downloadAgents
•	downloadOffices
If you wish to add a job for a different property type not found in the default list, simply copy one of the jobs above and rename it, then supply the appropriate type/class/query values from the Metadata.

The following parameters must be changed based on your RETS Server’s metadata:  searchType, searchClass, and query.  You may also want to change the outfile directory (by default datafiles will be created here in the bin directory).

“searchType” corresponds to the METADATA-RESOURCE.  For example, “Property” is a common listing METADATA-RESOURCE name.  “Office” is a common METADATA-RESOURCE for office information.

“searchClass” corresponds to the METADATA-CLASS.  This varies from server to server. Examples for Residential listings may be “RES” “RE\_1”, “RESI” etc.

Query must be constructed from FIELDS in the METADATA-TABLE to give you all of the listings with a status type of sold after a certain date. Below is an example of a query…NOTE: you MUST replace the field names and values inside the parentheses with the appropriate equivalents from the METADATA-TABLE and the METADATA-LOOKUPS (status is often a lookup).

((Status=SOLD),( ClosingDate=yesterday+))

“yesterday” is a Greta variable that will always send yesterday’s date to the RETS server, allowing you to get all sold activity since yesterday.  All you need to supply is the correct field name for ClosingDate/SoldDate and the correct field name and value for Status.

Once you have reviewed the Metadata and edited each of the default jobs, edit the run.default property.  Comment \\ metadataAll and uncomment the rest of the jobs.  Those are the searches you will run daily.

## Run RETS Sold Listing, Office and Agent Download ##
Go to the command prompt and navigate to RateYourExperience\greta\bin.  Type “greta” and hit ENTER.  When the jobs are finished, you will have the files in your bin directory (or other directory if you changed the default path).