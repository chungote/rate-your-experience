# Introduction #
Rate Your Experience is an open source Grails web application that runs in a Java servlet container. This guide will help make sure you have properly installed all the dependent libraries and tools to get Rate Your Experience up and running.


# Details #
## System specifications ##
The minimum system requirement is 1GB RAM.  Storage and bandwidth depends on the size of your Association.  [SliceHost](http://www.slicehost.com/) and [Linode](http://www.linode.com/) offer low-cost virtual private server hosting packages that are ideal for small through large Associations.

## Java ##
It is recommended that you use [Java 6](http://www.oracle.com/us/technologies/java/index.html). You can find recent downloads [here](http://www.oracle.com/technetwork/java/javase/downloads/index.html), as well as installation instructions for your environment.

## Grails ##
You need to install [Grails 1.2x](http://www.grails.org/Download). Download the binary file and follow the [installation](http://www.grails.org/Installation) instructions.

## Apache Tomcat ##
You will need a Java servlet container to run this web application.  It is  recommend that you use Apache Tomcat 5.5 or 6x.  [Download](http://tomcat.apache.org/download-55.cgi) the binary distribution and follow the [installation](http://tomcat.apache.org/tomcat-5.5-doc/setup.html) instructions.

## MySql ##
It is recommended that you use a MySql 5.1 database.  Here are the links to [download](http://dev.mysql.com/downloads/mysql/) and [install](http://dev.mysql.com/doc/refman/5.1/en/installing.html) the free community version of MySql on your operating system.

Once MySql is installed, you need to create a database named “rye”:
mysql> CREATE DATABASE rye;

Next, create a user named “rye”, and create a secure password in place of ‘password’ in the example below:
CREATE USER 'rye'@'localhost' IDENTIFIED BY 'password';

Next you will grant privileges for that user:

GRANT ALL ON rye.**TO 'rye'@'localhost';**

Remember the password you created…we will need it when editing the configuration file!

## RYE Code ##
[Download](http://code.google.com/p/rate-your-experience/downloads/list) the latest release of project from the GoogleCode site as a zip file.