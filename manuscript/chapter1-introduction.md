# Chapter 01  :  Introduction to Puppet

C> We are only puppets, our strings
C> are being pulled by unknown forces
C>
C>               -- Georg Buchner


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


* **Provisioning**
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
"Infrastructure as a Code" or "Programmable Infrastructure" is where today's generation tools such as Puppet, Chef, Ansible, Salt fit in. These tools essentially allow one to write the state of the infrastructure using a higher level  language and store it as a code. Since this is a code, one could bring in the best practices that developers have been following for years e.g. using version control systems, use of sophisticated editors, test driven development, peer programming etc. You could completely re build the infrastructure in case of disaster, as long as you have the code repository, compute resources and data backups in place. Since this code is written in a simple declarative syntax, it is self documenting and offers visibility to all stakeholders into the way infrastructure is built and configured.

![Evolution of Configuration Management](images/chapter1/config_mgmt_approaches.png)


| Approach     | Advantages     | Disadvantages
| :------------- | :------------- | :------------- |
| Manual | simple    | ad hoc, error prone, inconsistent, not repeatable |
| Scripts | repeatable, automated     | procedural, not scalable, inflexible |
| Images | repeatable, automated   | size, change management is not easy |
| Infrastructure as a Code | repeatable, flexible, scalable, automated, consistent     | agent based, learning curve  |


## Why to use Puppet ?
Now that we have started discussion on   Infrastructure as a Code, specifically Puppet, lets learn about what makes it a compelling tool for configuration and change management.  

### Declarative vs Procedural Approach
Scripts take a procedural approach towards automation. With scripts, we focus on the **how** part. e.g. how to install a package, how to create a user, how to modify it later, how to do it on a specific platform. And if you would want to add a support for another platform, you may have to add additional procedure and write a conditional to check for the platform and call the relevant code. This involves a lot of efforts.

On the other hand, Puppet takes a declarative approach towards automation. With Puppet, our focus changes from   **how** part to **what**. Instead of writing procedures, we start using a simple declarative syntax to define the desired state of infrastructure.  Let me explain this with an analogy.

Lets say we want to build a house. When we  set out to do so, we hire a contractor, who in turns has a team of construction workers who know how to build it brick by brick. They do all the hard work to bring our house into a reality. Thats the *how* part.

On the other hand, you have a Architect. Lets take a moment and think about what he or she does. An Architect creates a plan, a blue print, which is nothing but a description of how your house should look like. The architect envisions the end state of your house, thinks about *what* should it consists of, breaks it down into components,  and starts creating  specification for each. He would then stitch it together to create a blueprint of our house, and hands it to the contractor to go and build it. This is the how part.

Thats exactly what we would start doing with puppet, only difference being, we write the specification for desired state of IT infrastructure.

### Resource Abstraction Layer  
We just learnt about puppet allowing us to write the desired state of the infrastructure using a descriptive language. Now  this concept is brought into a reality with the its Domain Specific Language(DSL) which consists of a Resource Abstraction Layer (RAL). Lets describe how this works,

*TODO*: Create an image for each step below.

* Puppet looks at  infrastructure as a collection of entities to manage e.g. package, service, user, network interface etc.
* It then takes the  procedures, the actual logic to manage these entities and  bundles it into something called as **Providers**. Providers are platform specific. That way, each entity may have multiple providers e.g. managing user on linux vs osx vs windows.
* On top of these procedures, puppet creates an abstraction layer. Instead of defining the procedures, it offers the users a simple declarative syntax to define the state of the entity and its properties, in the form of **Resources**.
* Puppet, then does the translation between Resources and Providers, and calls the procedure to put the entity in to the desired state just as described by the user.

This behavior allows the users of the puppet to create policies stating what which entities should be present or absent, with what properties.

### Convergence and Idempotence
Puppet reads the resources, calls the re relevant providers for the platform it runs on, and ensures the desired state of the resource is achieved. While it does so, it may need to make changes to the system. But what if the resource has already achieved the desired state and needs no further updates?  Puppet has the  built in intelligence to know what is the current state of the resource is. Instead of making changes blindly, it first compares the current state of the resource with the desired state, and the makes a decision whether it requires any changes, and if yes, what changes. This would ensure that puppet. This process is called as convergence.

e.g.

Lets assume we have written a resource to create  a user  with a password.

*TODO*: Draw diagrams

*  First time puppet applies this resource on the system, the user may not exist. Puppet detects the current state, compares it with the desired state which mentions it should exist, and finds the configuration drift. It then creates the user with the password to bring the current state to desired state.

* Lets assume we run puppet again to apply the same resource. This time too it will compare the desired state with current state. Since the user is already present with the password provided, it deems no changes necessary. Instead of attempting to create the user again, it will skip the resource and move on to the next one.  

* Lets assume we updated the password information for the user in our code description of the resource, and excute puppet. This time, while comparing the current state with desired state, it detects that the user is present, but the password is updated. It does not attempt to create a user, but only changes one property i.e. password.  

Idempotence is a useful property to  ensures that puppet maintains the state of the infrastructure such that its always  in the policy. This also makes change management easier as one could keep running puppet as a service which invokes itself at regular intervals, pulls the changes, and apply only what is changed.



### Centralized Configuration Management System  
A typical installation of puppet involves  a Puppet Master, which is a centralized management console and Agents runnings on every node managed.  Any changes to nodes have to go through the Puppet Master. This stream lines the process of pushing updated.  Instead of iterating over a list of hosts using a for loop or other such methods, or logging into each system to make changes, all you need to do is push updates to Puppet Master, from where those are automatically propogated to the nodes.  

*TODO* ![centralized_management](images/)

### Pull Approach  
While puppet offers a centralized management approach, it works unlike most client server schemes. Instead of pushing updates to the nodes from master, its the duty of puppet agent to go the master,  pull changes, and apply. Pull method offers more flexibility and scalability for the following reasons,

* Each node could decide how often or how rare it should update. Some systems need frequent updates, where as others need not be updated for weeks. You could control this frequency.

* No need to manage inventory and connection details on the master. Nodes could come and go, and could be configured based on dynamic rules to classify them based on certain property e.g. host names, environments, or even hardware addresses.

* With push based approach, master must have a ability reach out and connect to each node managed in order to configure it. A lot of times you may have a master on a cloud or in a separate data center than nodes being managed, which could be behind a firewall or NAT device in a private network. In case of pull method, as long as the master is available on a well known address, and is reachable from the nodes, configurations can be pulled and applied.

### Code vs Data
A lot of applications that we configure on our servers are generic eg. apache, tomcat, mysql, mongo. These applications have a install base of hundreds of thousands of servers, used by organizations across the globe. Ever wondered how these become specific to your environment ? Even though you use the same apache web server used by many others, its how you configure it makes the difference. Even in single organization, you may have a apache server which behaves differently in different environment based on the configuration profile created. The process of setting up an application involves,

*TODO* diagram?

* Installing the generic application either from a source, package or a repository.
* Adding data. This where you set configuration parameters  e.g. port, user, max connections, webroot for apache.
* Start, enable the service.

Puppet allows separation of  code and data.

* Using Puppet's DSL, we write infrastructure code to install packages start services etc. Code is generic.

* Puppet's variables/parameters/facts, scopes, templates, along with tools such as Hiera and ENC provide a way to create different configuration profiles specific to different nodes, environments, platforms etc.


### Shared Library of Infrastructure Code
With puppet's ability to separate code and configuration data, the declarative code that you write in the form of modules with  puppet becomes generic enough to be shared and be reused. And since this code is in the version control, hosted services such as github offer the perfect means to publish this code. As you start writing code with puppet, you would discover about puppet forge, a library of community written modules. At the time of writing, there are more than 4000 modules available on puppet forge. Similar to a lot of open source code, you need not re invent the wheel. For most open source applications, you would find very sophisticated modules which you could use without even single line change. Download the modules, install it on your own puppet master, add configuration profile, and off you go.


### Cloud Integrations
With emergence of cloud, computing is moving towards the utility model. More and more organizations have already migrated or contemplating to migrate a partial or whole of their computing setup to cloud. And with that happening, which ever automation tool that you would consider, needs to have a close integration with the cloud platform that you plan to use. Provisioning of infrastructure components before puppet comes in and starts configuring  There are two ways Puppet provides a way for this,


1. Through library of custom resources/libraries  which allow one to write provisioning of cloud components in the form of resources.

1. Cloud specific tools e.g. Cloudformation on AWS or Heat on Openstack are some of the tools which help provision components which are specific to that cloud and then call puppet to do the configurations.

1. Third party tools such as Vagrant, Terraform have in turn ability to talk to multiple cloud providers. These tools typically provision servers on the cloud and then hand it off to puppet for configurations.

### Iterative Approach to Automation  
However convinced you are with Puppet, scrapping  your existing automation tool  overnight for a shiny new tool may have  unknown risks attached. More over, it may could  be challenging  to get a buy in from your management to invest in time, money and resources to implement a new solution without showing them the value.

With puppet, you could take a iterative approach towards automation. You could start with a single application, or even a single entity such as a system user to manage. Once you see the value, show it to all stake holders, get a buy in and move to the next application, one at a time.


### Device Support  
Managing configurations on systems running common operating systems such as windows, linux, os x, where puppet agent application  can be installed is easy.  Its a completely different beast when it comes to   managing configurations on  devices running their own specialized version of operating systems/firmwares. Examples are configuring CISCO's network switches routers, EMC's storage array.

Along with programmable infrastructures, new concepts such as Software Defined Networking(SDN) and Software Defined Storage(SDS) are taking root and changing the way devices are being managed. Puppet supports managing devices in two ways,

1. Devices that are based on linux and have puppet agent ported to run on those can be configured the same way as other generic systems.
1. Sub set of devices that do not have puppet agent can still be configured with puppet's device support over ssh/telnet. For such devices, puppet uses push instead of pull approach.


### Audit and Compliance
With ability to define the state of the  infrastructure components as a code and then  converge, one could easily codify the infrastructure policies and have them enforced. Puppets ability to test, log changes, and reporting mechanisms  help keeping a trail of the state of the systems and its components over time and track who made changes, when, if there are any nodes which have fallen out of policy etc.


## When to Use Puppet ?
You should consider using puppet if,

* Configuration Management + Change Management: You have many nodes to deploy with changes happening often. You need to update the nodes and applications running on those often.  
* Compliance and Audit: When your organization has to comply to policies and you need an ability to convert those policies into a code which would auto correct and bring the nodes into the policy in case of configuration drifts.  
* Software Delivery : If you are in buisness of building software and delivering as ova images or similar, puppet is better approach to deliver the product and push updates to it.

## Who is it for?


## What Puppet is not
* Graphical Management Tool (SCCM):
  If you are looking for a tool which would allow you to manage everything through a graphical interface without writing any code or without ever having to use an editor, well puppet is not the tool for you.  I have come across many engineers, who say "well, the capabilities of puppet sounds great, but can I do all of this using a GUI where I can just click click and get things done.... ? " Well, its infrastructure as a code is what we are talking about. Even though enterprise puppet puppet offers a nice GUI, its mostly for reporting and classifications. Since I started using puppet and similar tools, I have been using text editors more often.

  * Automated Testing Tool ( selenium ):
  Its not a silver bullet. Its not one solutions to all. I meet a lot of QA folks who have heard that puppet would automate everything and you could use it for testing too.  Well, there is always a special purpose tool for each task and the application testing is not puppet's ball game.  Sure puppet could help in testing by letting you automate the process of building and configuring a fresh environment to run your tests inside, and give you ability to do it repeatedly. It also gives you a way to test infrastrcuture code. However, its not a test automation tool.


  * Application Deployment Tool:
  Even though Puppet has been talking about application orchastration, if you are looking for a tool purely for application deployments, rolling updates, canary releases, orchestrated deplyoments over multiple hosts, you have tools which do it better. One tool I could suggest you for application deployment and orchastration is Asible which is push based, and works better in such scenarios.


  * Agent less Management System:
  Except for a sub set of network devices, puppet mandates running agents on each node being managed. In fact its designed to be heavy on the agent side which is responsible to initiate communication with the master, pull policies,  enforce and report back.  If you need a agent less management system, puppet is not the one. Again, I would suggest using Ansible in such cases, which works over ssh and is agent less.


  * Puppet Use Cases/ Customer Stories

## Comparison with Similar Tools
  * Puppet vs   Chef
  * Comparison with Ansible
  * Comparison with Docker
