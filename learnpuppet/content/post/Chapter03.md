+++
date = "2016-08-02T19:48:36+05:30"
draft = true
title = "Evolution of Configuration Management"

+++

The need for managing configurations and ongoing  changes had been a challenge which has seen various approaches. Lets have a look at the evolution of configuration management,

### Manual  
As systems engineers, we almost always begin configuring systems by hand, in a ad hoc manner. This approach is the easiest, and useful when you have only a handful of systems to manage, simple configurations, and where you do not have repeatable tasks or updates. However, as you start growing, this crude approach quickly gets out of control. It also involves manual processes, which mandates a operator to be present, and is prone to errors or omissions.


### Scripts  
Scripts allow one to take a sequence of commands to run and put it in a procedural program. Whenever there is need to repeat the process,  scripts come in very handy. Some of the popular scripting languages amongst the systems personnel include shell/bash, perl, python, ruby or powershell.  Scripts are almost always the first approach towards automating manual tasks. However, scripts are not scalable or flexible enough to manage a sophisticated infrastructure spanning across multitude of environments or the ones involving multiple different operating systems etc.

T> ## Configuration Management and  Software Configuration Management
T>
T> Software Configuration Management is referred to often with context of
T> Revision Control which is about tracking changes to the application code.
T> This is just one part of a larger field of Configuration Management.  


### Golden Images/ Templates  
Golden images, or templates, or simply os images, are probably the quickest way to deploy servers complete with configurations, specially in virtual or cloud environments. Images are nothing but pre baked templates with operations system files, applications, and configurations. Take any cloud provider, and one of the first components to choose while you provision a server is the images. A lot of organizations these days package their products in the form of images such as ova, vmdk or even vagrant's box format. However images have one major problem i.e. change management. Every time there is an update, even a single line change,  one needs to build a new image. Not only this complete system image needs to be distributed but also existing systems need to be replaced with the new image. Imagine doing that in a dynamic environment involving frequent updates across  hundreds of servers. That could get too cumbersome. And thats where the need to come up with a new approach.  

### Infrastructure as a Code  
"Infrastructure as a Code" or "Programmable Infrastructure" is where today's generation tools such as Puppet, Chef, Ansible, Salt fit in. These tools essentially allow one to write the state of the infrastructure using a higher level descriptive  language and store it as a code. Since this is a code, one could bring in the best practices that developers have been following for years e.g. using revision control systems, use of sophisticated editors, test driven development, peer programming etc. You could  even build the complete infrastructure from scratch in case of a disaster, as long as you have the code repository, compute resources and data backups in place. Since this code is written in a simple declarative syntax, it is self documenting and offers visibility to all stakeholders into the way infrastructure is built and configured.

![alttag](https://raw.githubusercontent.com/initcron/book-puppet-fundamentals/master/manuscript/images/chapter1/config_mgmt_approaches.png)


| Approach     | Advantages     | Disadvantages
| :------------- | :------------- | :------------- |
| Manual | simple    | ad hoc, error prone, inconsistent, not repeatable |
| Scripts | repeatable, automated     | procedural, not scalable, inflexible |
| Images | repeatable, automated   | size, change management is not easy |
| Infrastructure as a Code | repeatable, flexible, scalable, automated, consistent     | agent based, learning curve  |
