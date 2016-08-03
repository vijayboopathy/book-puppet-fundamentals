+++
date = "2016-08-02T19:48:24+05:30"
draft = true
title = "Centralized Configuration Management System"

+++

Centralized Configuration Management System  
A typical installation of puppet involves  a Puppet Master, which is a centralized management console and Agents runnings on every node managed.  Any changes to nodes have to go through the Puppet Master. This streamlines the process of pushing updated.  Instead of iterating over a list of hosts using a for loop or other such methods, or logging into each system to make changes, all you need to do is push updates to Puppet Master, from where those are automatically propogated to the nodes.  

*TODO* ![centralized_management](images/)

### Pull Approach  
While puppet offers a centralized management approach, it works unlike most client server schemes. Instead of pushing updates to the nodes from master, its the duty of puppet agent to go the master,  pull changes, and apply. Pull method offers more flexibility and scalability for the following reasons,

* Each node could decide how often or how rare it should update. Some systems need frequent updates, where as others need not be updated for weeks. You could control this frequency.

* No need to manage inventory and connection details on the master. Nodes could come and go, and could be configured based on dynamic rules to classify them based on certain property e.g. host names, environments, or even hardware addresses.

* With push based approach, master must have a ability reach out and connect to each node managed in order to configure it. A lot of times you may have a master on a cloud or in a separate data center than nodes being managed, which could be behind a firewall or NAT device in a private network. In case of pull method, as long as the master is available on a well known address, and is reachable from the nodes, configurations can be pulled and applied.
