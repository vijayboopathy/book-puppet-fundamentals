# Chapter 01  :  Introduction to Puppet

C>   "We are only puppets, our strings
C> are being pulled by unknown forces."
C>            - Georg Buchner


My journey with Puppet began back in 2008, when as I was part of the Operations Team involved in managing a infrastructure of a few hundred servers with web applications running on it, spanning across multiple environments. Our team consisted of folks located in  India and US and managing the environment during our respective day time, on time shared basis. Each  one of us would come in during our day and make ad hoc changes when necessary, and not always communicate with the team on the other side of the globe at the end of the day. We did not have daily sync up meetings either. Issues with the product  pop up regularly, followed by flipping through logs, root cause analysis and few hours spent just to  figure out whether it was due to the inconsistency with the environment, configurations or it was actually the application code related bug. Tired of this fire fighting, we started looking for solutions to help us efficiently manage this environment. And thats when we came across Puppet, which was already popular, was picked by likes of google, and had a active community around it.

Results were immediate, and tangible. After implementing puppet based configuration management system,

* We now had a centralized tool which streamlined our process managing configurations. Resulted in minimal ad hoc changes and a **consistency** across the environment.

* Since we started writing infrastructure as a Code, everyone including the developers had **visibility** into the way infrastructure was configured  

* The **error rates**, specially related to configurations dropped  significantly, giving us more time to focus on more significant and exiting work. Also giving us more time back in our day.

That was the beginning of my journey with devops automation tools, which also involves working with Chef, and Ansible. Puppet was the first kid in the block, and has come a long way from the time it was created by **Luke Kanies** in 2005, to become a very matured and a indispensable tool in the kitty of a devops engineer.

Before we start looking into what makes puppet so appealing as a automation tool, lets first understand what configuration management is about.

## Infrastructure Life Events and Puppet

If you are someone who is in the business of managing  more than a handful of systems, you should be familiar with the term "Configuration Management". You should also be familiar with the following life events of setting up and managing a infrastructure hosted on physical or cloud servers.

![Infrastructure Events](images/chapter1/infra_lifecycle.png)


* **Provision**
  * Provision servers, physical, virtual, cloud or a combination.
  * Install Operating System either using manual/automated install process or using an image/template.

* **Configuration Management**
  * Prepare the systems with the base configurations such as logins,  packages, security configurations etc.
  * Install and configure services such as apache, tomcat, setup cron jobs, install and configure databases
  * Deploy application code

* **Change Management**
  * Update configurations parameters across a class of servers eg. update port that web server is running on.
  * Deploy new version of the application code, push security patches etc, install additional services.

Puppet serves as a excellent tool for Configuration Management as well as Change Management. And along with tools such as Razor, Cloud Plugins, Vagrant, Terraform it could also help automating provisioning of servers too. However puppet as a tool by itself does have an ability to provision and comes in to play once the Operating System is installed and puppet agent is setup.


## Evolution of Configuration Management
The need for managing configurations and ongoing  changes had been a challenge which has seen various approaches. Lets have a look at the evolution of configuration management,

### Manual  
As systems engineers, we almost always begin configuring systems by hand, in a ad hoc manner. This approach is the easiest, and useful when you have only a handful of systems to manage, simple configurations, and where you do not have repeatable tasks or updates. However, as you start growing, this crude approach quickly gets out of control. It also involves manual processes, which mandates a operator to be present, and is prone to errors or omissions.


### Scripts  
Scripts allow one to take a sequence of commands to run and put it in a procedural program  code. Whenever there is need to repeat processes,  scripts come in very handy. Some of the popular scripting languages amongst the systems personnel include shell/bash, perl, python, ruby or powershell.  Scripts are the initial approach towards automating manual tasks, this approach is not scalable or flexible enough to manage a sophisticated infrastructure spanning across multitude of environments or the ones involving multiple different operating systems etc.

### Golden Images  
Golden images, or templates, or simply os images, are probably the quickest way to deploy servers complete with configurations, specially in virtual or cloud environments. Images nothing but pre baked templates with operations system files, applications, and configurations. Take any cloud provider, and one of the first components to choose while you provision a server is the images. A lot of organizations these days package their products in the form of images such as ova, vmdk or even vagrant's box format. However images have one major problem i.e. change management. Every time there is an update, even a single line change,  one needs to build a new image. Not only this complete system image needs to be distributed but also existing systems need to be replaced with the new image. Imagine doing that in a dynamic environment involving frequent updates across  hundreds of servers. That could get too cumbersome. And thats when the need to build a new approach arose.  

### Infrastructure as a Code  
*Infrastructure as a Code* or *Programmable Infrastructure* is where today's generation tools such as Puppet, Chef, Ansible, Salt fit in. These tools essentially allow one to write the state of the infrastructure using a higher level  language and store it as a code. Since this is a code, one could bring in the best practices that developers have been following for years e.g. using version control systems, use of sophisticated editors, test driven development, peer programming etc. You could completely re build the infrastructure in case of disaster, as long as you have the code repository, compute resources and data backups in place. Since this code is written in a simple declarative syntax, it is self documenting and offers visibility to all stakeholders into the way infrastructure is built and configured. 

![Evolution of Configuration Management](images/chapter1/config_mgmt_approaches.png)


| Approach     | Advantages     | Disadvantages
| :------------- | :------------- | :------------- |
| Manual | simple    | ad hoc, error prone, inconsistent, not repeatable |
| Scripts | repeatable, automated     | procedural, not scalable, inflexible |
| Images | repeatable, automated   | size, change management is not easy |
| Infrastructure as a Code | repeatable, flexible, scalable, automated, consistent     | agent based, complex  |


## Declarative Approach vs Procedural


## Puppet Features

### Declarative vs Procedural
Using scripts to manage configurations is a manual approach. procedural programming languages

### DSL/RAL : Resources and Providers
### Idempotence
### Centralized Configuration Management System
Puppet is a

*TODO* ![centralized_management](images/)

### Pull Approach
### Infrastructure as a Code
### Shareable Code
### Cloud Integrations
### Iterative Approach
### Device Support
### Audit and Compliance

## When to Use Puppet
  * Configuration Management at Scale
  * Change Management
  * Auto Correct Configuration Drifts
  * Puppet Use Cases/ Customer Stories
  * Centralized CMDB/Portal

## Who is it for?

## What Puppet is not
  * Graphical Management Tool (SCCM)
  * Automated Testing Tool ( selenium )
  * Application Orchestrator (not yet one?)
  * agent less management system


## Comparison with Similar Tools
  * Puppet vs   Chef
  * Comparison with Ansible
  * Comparison with Docker
