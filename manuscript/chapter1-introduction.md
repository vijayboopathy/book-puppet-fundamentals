# Chapter 01  :  Introduction to Puppet

My journey with Puppet began back in 2008, when as I was part of the Operations Team involved in managing a decent sized infrastructure, applications running on it, spanning across multiple environments. Operations team that managed this infrastructure  worked out of India and US on time shared basis. Each  one of us would come in during our day and make ad hoc changes, and not always communicate with the team on the other side of the globe at the end of the day. We did not have sync up meetings. And the issues would pop up every now and then and we would spend some time to just figure out whether it was due to the inconsistency with the environment, configurations or its actually a code related bug. Tired of this fire fighting, we started looking for solutions to help us efficiently manage this environment. And thats when we came across Puppet, which was already popular, was picked by likes of google, and had a active community around it.

Results were immediate, and tangible.

* We now had a centralized tool which streamlined our process managing configurations. Resulted in minimal ad hoc changes and a **consistency** across the environment.

* Since we started writing infrastructure as a Code, everyone including the developers had **visibility** into the way infrastructure was configured  

* The **error rates**, specially related to configurations went down significantly, giving us more time to focus on more significant and exiting work. Also giving us more time back in our day.

That was the beginning of my journey with devops automation tools, which also involves my tryst with Chef, and Ansible. Puppet was the first kid in the block, and has come a long way from the time it was created by Luke Kanies in 2005, to become a very matured and a indispensible tool in the kitty of a devops engineer.

Before we start looking into what makes puppet so appealing as a automation tool, lets first understand what configuration management is about.

## Configuration Management

If you are someone who is in the business of managing  more than a handful of systems, you should be familiar with the term "Configuration Management". As  Operations Engineers, Systems Administrator or a IT personnel, you may have to perform a few or all of the following tasks,

![Infrastructure Events](images/chapter1/infra_lifecycle.png)


* **Provisioning**
  * Provision servers, physical, virtual, cloud or a combination of all.
  * Install Operating System either using manual/automated install process or using an image/template.

* **Configuration Management**
  * Prepare the systems with the base configurations such as logins,  packages, security configurations etc.
  * Install and configure services such as apache, tomcat, setup cron jobs, install and configure databases
  * Deploy application code

* **Change Management**
  * Update configurations parameters across a class of servers eg. update port that web server is running on.
  * Deploy new version of the application code, push security patches etc, install additional services.

Puppet serves as a excellent tool for Configuration Management as well as Change Management. And along with tools such as Razor, Cloud Plugins, Vagrant, Terraform it could also help automating provisioning of servers too. However puppet as a tool by itself does have an ability to provision and comes in to play once the Operating System is installed and puppet agent is setup.


## Approaches to Manage Configurations
The need for managing configurations and ongoing  changes had been a challenge which has seen various approaches. Lets look at some,


![Evolution of Configuration Management](images/chapter1/config_mgmt_approaches.png)

    - Evolution of Configuration Management
        -  Manual
        -  Scripts
        -  Images
        -  Infrastructure as a Code

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
