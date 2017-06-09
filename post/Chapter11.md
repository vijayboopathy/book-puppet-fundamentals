+++
date = "2016-08-02T19:48:12+05:30"
draft = true
title = "Cloud Integrations"

+++

With emergence of cloud, computing is moving towards the utility model. More and more organizations have already migrated or contemplating to migrate a partial or whole of their computing setup to cloud. And with that happening, which ever automation tool that you would consider, needs to have a close integration with the cloud platform that you plan to use. Provisioning of infrastructure components before puppet comes in and starts configuring  There are two ways Puppet provides a way for this,


1. Through library of custom resources/libraries  which allow one to write provisioning of cloud components in the form of resources.

1. Cloud specific tools e.g. Cloudformation on AWS or Heat on Openstack are some of the tools which help provision components which are specific to that cloud and then call puppet to do the configurations.

1. Third party tools such as Vagrant, Terraform have in turn ability to talk to multiple cloud providers. These tools typically provision servers on the cloud and then hand it off to puppet for configurations.
