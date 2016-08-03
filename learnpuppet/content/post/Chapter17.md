+++
date = "2016-08-02T19:47:56+05:30"
draft = true
title = "What Puppet is not?"

+++

* Graphical Management Tool (e.g. SCCM):
  If you are looking for a tool which would allow you to manage everything through a graphical interface without writing any code or without ever having to use an editor, well puppet is not the tool for you.  I have come across many engineers, who say "well, the capabilities of puppet sounds great, but can I do all of this using a GUI where I can just click click and get things done.... ? " Well, its infrastructure as a code is what we are talking about. Even though enterprise puppet puppet offers a nice GUI, its mostly for reporting and classifications. Since I started using puppet and similar tools, I have been using text editors more often.

  * Automated Testing Tool ( e.g. selenium ):
  Its not a silver bullet. Its not one solutions to all. I meet a lot of QA folks who have heard that puppet would automate everything and you could use it for testing too.  Well, there is always a special purpose tool for each task and the application testing is not puppet's ball game.  Sure puppet could help in testing by letting you automate the process of building and configuring a fresh environment to run your tests inside, and give you ability to do it repeatedly. It also gives you a way to test infrastrcuture code. However, its not a test automation tool.


  * Pure Application Deployment and Orchestration Tool:
  Even though Puppet has been talking about application orchestration, if you are looking for a tool purely for application deployments, rolling updates, canary releases, orchestrated deployments over multiple hosts, you have tools which do it better. A few  tools I could suggest you for application deployment and orchestration are Asible, Capistrano, Code Deploy  which are push based, and work better in such scenarios.


  * Agent less Management System:
  Except for a sub set of network devices, puppet mandates running agents on each node being managed. In fact its designed to be heavy on the agent side which is responsible to initiate communication with the master, pull policies,  enforce and report back.  If you need a agent less management system, puppet is not the one. Again, I would suggest using Ansible in such cases, which works over ssh and is agent less.

  * Software Configuration Management(SCM) Tool
  SCM is a part of the larger Configuration Management and typically refers to the practice of revision/version control. Puppet is not the tool which does the version control, however it can be used to replicate and manage software configurations across
  a cluster of nodes.

  * A one stop  Devops solutions

  * Puppet Use Cases/ Customer Stories
