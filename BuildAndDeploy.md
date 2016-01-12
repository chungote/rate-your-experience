# Build the WAR file #

From the command prompt, go to your RateYourExperience directory. Type “grails war” and hit ENTER.  This will create a “rateyourexperience-1.0.war” file.  Copy this file into your TOMCAT\_HOME\webapps directory and [restart ](http://www.jajakarta.org/tomcat/tomcat3.2-4.0/tomcat-3.2.3/doc/uguide/tomcat_ug.html)Tomcat.
If you are using a different Java Servlet container,  view these additional deployment [references](http://www.grails.org/Deployment).

## Log in ##
Browse to yourURL.RateYourExperience and login as “admin/admin”.  (note: change your password after logging in)
The application has created the database for you.  Now you are ready to begin loading your data and setting up users.