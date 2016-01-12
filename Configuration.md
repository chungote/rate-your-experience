# Configuration #


Database and application configuration for Rate Your Experience. The configuration files can be found in the RateYourExperience?\grails-app\conf directory.

## Database Configuration ##

In a text editor, open the file named “DataSource?.groovy”. You will notice that there are 3 database environments: development, test and production. “Development” is setup to be an in-memory database that is refreshed each time the application starts. “Test” and “Production” are setup to use a MySql database. If you are using the default MySql database configuration, all you will need to change to deploy the application is the “Production” datasource password. If you wish to use a different type of database, see section 3.3 in this [configuration](http://www.grails.org/doc/1.0.x/guide/3.Configuration.html) for altering the DataSource properties.

## Application Configuration ##

In a text editor, open the file named “Config.groovy”.

### To set absolute links: ###

Go to production { environments {. Set the grails.serverURL property to your domain name.

### To set absolute links: ###
Go to production { environments {. Set the grails.serverURL property to your domain name.

### To set mail defaults: ###

Go to grails { mail {. Set the properties for your smtp (mail) server: host, port, username, and password.

### Tomcat manager settings: ###

When you installed Apache Tomcat, you selected a username and password for Tomcat manager. Configure this information for Rate Your Experience by using the tomcat.deploy.username, tomcat.deploy.password, and tomcat.deploy.url properties.