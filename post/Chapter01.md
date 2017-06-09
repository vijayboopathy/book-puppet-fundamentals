+++
date = "2016-08-02T19:48:42+05:30"
draft = true
title = "How I got started with Puppet and Devops ?"

+++

As Georg Buchner said:

> We are only puppets, our strings
> are being pulled by unknown forces.

My journey with Puppet began back in 2008, when as I was part of the Ops Team managing web scale infrastructure for a SaaS company. Our team consisted of ops engineers in  India and US working out of  their respective timezones, keeping lights on 24x7.  As part of day to day operations, all of us would  make ad hoc changes to the servers, and not always communicate back with the team on the other side of the globe. We did not have daily sync up meetings either. As a result of this ad hoc, inconsistent setup, regularly, issues would pop up with the product, in pre production/integration as well as in production environments. Being in charge of triaging, my team would  spend a lot of time flipping through logs, doing root cause analysis and  figuring out whether its a problem due to inconsistent configurations or a actual code related issue. Tired of this fire fighting, we started looking for solutions to help us efficiently manage this environment. And thats when we came across Puppet, which was popular, was already picked by likes of google, and had an active community around it. We started using it to setup the infrastructure as well as manage changes through a centralized console.

Results were immediate, and tangible. After implementing puppet based configuration management system,

* We now had a centralized tool which streamlined our process of managing configurations. This resulted in minimal ad hoc changes and **consistency** across the environments.

* **Visibility** was another important outcome. Since we started writing infrastructure as a Code, everyone including the developers had **visibility** into the way infrastructure was configured. All one had to do was look at the svn/git repository, the last commits to know what changes were made, my whom and when. What more, developers could even tweak the application properties in their own integration environments.

* **Error rates**, specially related to configurations dropped  significantly, giving us more time back in our day, to focus on scale and other important issues.

That was the beginning of my journey with devops automation tools, which also includes exposure to Chef, and Ansible. Puppet was the first kid on the block, and has come a long way from the time it was created by **Luke Kanies** along with initial developers in 2005, to become a very matured and a indispensable tool in the kitty of a devops engineer.

Before we start looking into what makes puppet a excellent choice for a automation tool, lets first understand what configuration management is about.
