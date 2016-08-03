+++
date = "2016-08-02T19:48:39+05:30"
draft = true
title = "Infrastructure Life Events and Puppet"

+++

If you are the one  who is in the business of managing  more than a handful of systems, you should be familiar with the term "Configuration Management" (not to confuse with traditional Software Configuration Management or SCM). Be it physical servers, virtual machines or cloud based setup, infrastructure typically goes through the  following life events,

![alt tag](https://raw.githubusercontent.com/initcron/book-puppet-fundamentals/master/manuscript/images/chapter1/infra_lifecycle.png)

* **Provisioning**
  * Provision servers - physical, virtual or cloud. This is where the servers are brought into being.
  * Install Operating System either using manual/automated install process or using an image/template.

* **Configuration Management**
  * Base Systems Configurations:  Prepare the systems with the base configurations such as users,  packages, security configurations, network setup etc.
  * Tech Stack: install and configure services such as apache, tomcat, middle wares, setup cron jobs, install and configure databases etc.
  * Application: Deploy the application code on top of the tech stack configured. This is where the code written by your team gets deployed with relevant configurations.

* **Change Management**
  Configurations made during the initial setup do not remain  do not last for a life time. Infrastructure is in the constant state of flux  and evolves over time. Change management involves,
  * Updating configurations parameters across a class of servers eg. update port that web server is running on.
  * Deploying new versions of the application code, push security patches etc, install additional services.

Puppet serves as a excellent tool for Configuration Management as well as Change Management. And along with tools such as Razor, Cloud Plugins, Vagrant, Terraform it could also  automate provisioning of servers too. However puppet as a tool by itself does have an ability to provision and comes in to play once the Operating System is installed and puppet agent is setup.

If you are looking for a tool which could also provision servers, and do it effectively, you should  consider Ansible.
