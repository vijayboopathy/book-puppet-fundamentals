#  Chapter 04  :  Building Blocks : Resources, RAL and  Manifests

In this session we are going to introduce you to the building blocks of puppet. We will discuss about Resources and Providers and the learn how to put resources together to create a manifest.

### Puppet Utility
Before we start talking about manifests, lets learn about this swiss knife puppet utility that we would be using to do almost everything, right from applying manifests, to find  information about nodes being managed by puppet master, to generate and install modules from puppet forge etc.

#### Invoking Puppet
Assuming puppet is installed on the systems, you could invoke it from a CLI as follows

{title="Invoking Puppet ", lang=shell, linenos=off}
~~~~~~~
[root@master vagrant]# puppet --version
4.3.2

~~~~~~~

#### Finding Help with Puppet

Puppet commands are structured as

`puppet <subcommand> <options>`

For example to learn how to use puppet, we will find help with the following command which lists all the sub commands that puppet supports.

{title="Finding Help ", lang=html, linenos=off}
~~~~~~~
[root@master vagrant]# puppet help

Usage: puppet <subcommand> [options] <action> [options]

Available subcommands:

  agent             The puppet agent daemon
  apply             Apply Puppet manifests locally
  ca                Local Puppet Certificate Authority management.
  catalog           Compile, save, view, and convert catalogs.
  cert              Manage certificates and requests
  certificate       Provide access to the CA for certificate management.
  certificate_request  Manage certificate requests.
  certificate_revocation_list  Manage the list of revoked certificates.
  config            Interact with Puppet's settings.
  describe          Display help about resource types
  device            Manage remote network devices
  doc               Generate Puppet references
  epp               Interact directly with the EPP template parser/renderer.
  facts             Retrieve and store facts.
  file              Retrieve and store files in a filebucket
  filebucket        Store and retrieve files in a filebucket
  help              Display Puppet help.
  inspect           Send an inspection report
  key               Create, save, and remove certificate keys.
  lookup            Data in modules lookup function
  man               Display Puppet manual pages.
  master            The puppet master daemon
  module            Creates, installs and searches for modules on the Puppet Forge.
  node              View and manage node definitions.
  parser            Interact directly with the parser.
  plugin            Interact with the Puppet plugin system.
  report            Create, display, and submit reports.
  resource          The resource abstraction layer shell
  resource_type     View classes, defined resource types, and nodes from all manifests.
  status            View puppet server status.

See 'puppet help <subcommand> <action>' for help on a specific subcommand action.
See 'puppet help <subcommand>' for help on a specific subcommand.
Puppet v4.3.2
~~~~~~~

To find help with a specific sub command invoke help as,

{title="finding help with sub commands", lang=shell, linenos=off}
~~~~~~~
puppet help apply
puppet help resource
~~~~~~~

### Resources - The building blocks

Resources are the building blocks of puppet. As discussed in the introductory chapter, as a user of puppet, we start looking at our infrastructure as a collection of entities, and start  writing resources to define the end  state and properties of one  entity at a time.

For eample, we would like to create a system user by name **sachin** with following properties

{title="user ", lang=html, linenos=off}
~~~~~~~
user      = sachin
uid       = 1010
home      = /home/sachin
password  = '$1$jzi/Xjfd$Fpj3P16NBzfiiQGlDj9rG0'
shell     = /bin/bash
~~~~~~~


Now, when we talk about writing these resources, you may have following questions,
* How are these resources written ?
* How do I write the state of each resource ?
* How  and where do I find the properties of these resources ?
* Where do I actually write these resources and organize them?

Lets start answering these questions one by one.


### Puppet's DSL

Resource are written in a special language created by the creators of Puppet, with its own simple rules and declarative syntax. Unlike a generic programming language such as C and Python,  its scope specific to writing automation code with puppet, its called as Domain Specific Language or simply DSL.  The DSL used by puppet is very simple. Lets now learn how  a resource can be written using puppet.

A definition of a resource is very similar to stating properties f a entity along with the state, quiet similar to the description above,

{title="Resource DSL ", lang=html, linenos=off}
~~~~~~~
TYPE { '<TITLE>':
  ensure       => <STATE>,
  <ATTRIBUTE>  => <VALUE>
}
~~~~~~~

Where,  

: TYPE      : System entity to manage  
: TITLE     : Instance of that entity   
: STATE     : Desired state of the entity  
: ATTRIBUTE : Property / Characteristic of the entity to be managed    
: VALUE     : Value of the attribute  

* Rules
  * Description of the type is enclosed in { }
  * Just like json, each Attribute ends with a comma (,) except for last one
  * Attributed and values are separated by fat arrow ( => )>

{title="Puppet Resource Example - User", lang=puppet, linenos=off}
~~~~~~~
user { 'sachin':
  ensure => present,
  home => '/home/sachin',
  shell => '/bin/bash',
  uid => '1010',
  password => '$1$jzi/Xjfd$Fpj3P16NBzfiiQGlDj9rG0'
}
~~~~~~~


I> ## Providers
I>
I> Each resource definition is translated to a actual procedure
I> which s platform specific e.g. creating users on
I> windows and linux has differs procedures. Puppet detects the
I> platform its running on and automatically invokes the
I> procedure through providers.

{pagebreak}

#### TODO: Anatomy of a Resource


#### Types of Resources - Inbuilt vs Custom
Puppet resource are of two types

**Built in**: These are packaged with puppet by default and  are sufficient to manage most common system entities e.g. users, groups, packages, services, network interfaces, cron jobs etc. At the time of writing there are 47 built in resources available.  

List of Useful Built In resources

| Essential     | Additional     |
| :------------- | :------------- |
| package        | interface       |
| file           | host       |
| service        | augeas         |
| user           | ssh_authorized_keys       |
| group          | schedule       |
| mount          | tidy       |
| cron           |            |

For complete list of resource types, refer to
https://docs.puppetlabs.com/puppet/latest/reference/type.html


**Custom**: These are additional resource types to manage entities beyond the default ones and are packaged as part of the additional  modules.

Following are two examples of puppet resources, one to create a apache virtual host, other to configure a network interface on a cisco network device

{title="", lang=html, linenos=off}
~~~~~~~
apache::vhost { 'default':
    docroot             => '/var/www/document_root',
    server_name         => false,
    priority            => '',
    template            => 'apache/virtualhost/vhost.conf.erb',
}

cisco_interface_ospf {"Ethernet1/2 Sample":
   ensure => present,
   duplex => 'auto',
   speed  => 10000,
   shutdown => 'default'
}

~~~~~~~


####  Working with Puppet's Resource shell
Puppet comes with a *resource* sub command which lets us interact with the system using Puppet's RAL. It does two things,

1. Read: Provides an interface to quesry the state of a system entity, and covert it into a puppet code.

1.  Write/Modify: Using puppet's RAL, make changes to the state of system resources.

 
#### Namevars
#### Discovering Resources and Information About it


#### Creating Resources using Puppet Resource Shell


#### Properties of a Resource - Idempotence


####  Modifying Resources


####  Manifests


####  Writing our First Resource


#### Lab: Checking Âfor Syntax


#### Lab: Applying first Resource


####  Lab: Apply Again. See Idempotence in Action

####  Exercise: Adding a few more resources


####  Summary


#### Quiz
