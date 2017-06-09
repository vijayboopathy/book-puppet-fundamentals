# Code vs Data

A lot of applications that we configure on our servers are generic eg. apache, tomcat, mysql, mongo. These applications have a install base of hundreds of thousands of servers, used by organizations across the globe. Ever wondered how these become specific to your environment ? Even though you use the same apache web server used by many others, its how you configure it makes the difference. Even in single organization, you may have a apache server which behaves differently in different environment based on the configuration profile created. The process of setting up an application involves,


* Installing the generic application either from a source, package or a repository.
* Adding data. This where you set configuration parameters  e.g. port, user, max connections, webroot for apache.
* Start, enable the service.

Puppet allows separation of  code and data.

* Using Puppet's DSL, we write infrastructure code to install packages start services etc. Code is generic.
* Puppet's variables/parameters/facts, scopes, templates, along with tools such as Hiera and ENC provide a way to create different configuration profiles specific to different nodes, environments, platforms etc.
