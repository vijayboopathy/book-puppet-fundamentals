#  Chapter 04  :  Building Blocks : Resources, RAL and  Manifests

In this chapter  we are going to introduce you to the building blocks of puppet. We will learn about Resources and Providers and create a collection of resources in the form of  manifest.

### Puppet Utility
Before we start talking about manifests, lets learn about this swiss knife puppet utility that we would be using to perform most of the  operations with puppet, right from applying manifests, to find  information about nodes being managed by puppet master, to generate and install modules from puppet forge etc.

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

Resource are written in a special language created by the creators of Puppet, with its  simple rules and declarative syntax. Unlike generic programming languages such as C and Python,  its scope is specific to writing automation code.  Hence its also called as a Domain Specific Language or simply DSL.  The DSL used by puppet is very simple. Lets now learn how  a resource can be written using puppet.

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
Based on whether you are managing core system functionalities, or additional entities, puppet resource are classified as,

**Built in/Core**: These are packaged with puppet by default and  are sufficient to manage most common system entities e.g. users, groups, packages, services, network interfaces, cron jobs etc. At the time of writing there are 47 built in resources available.  

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


**Custom**: These are additional, special purpose resource types to manage entities beyond the default ones and are packaged as part of the additional  modules.

Following are two examples of puppet resources, one to create a apache virtual host, other to configure a network interface on a cisco network device

{title="", lang=puppet, linenos=off}
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

T> ## Extending Puppet
T>
T> Custom resources allow you to extend puppet's
T> functionality by adding support to manage   
T> custom devices, applications, cloud platforms
T> etc using Puppet's simplified DSL. To write
T> custom resource, knowledge of
T> ruby is required.  

####  Working with Puppet's Resource shell
Puppet comes with a *resource* sub command which lets us interact with the system using Puppet's RAL, which has two main functions,

1. Read: Provides an interface to query the state of a system, and display it using Puppet's DSL.  This can also be used to covert current system state into puppet code.

1.  Write/Modify: Using puppet's RAL, make changes to the state of system resources.


#### Discovering Information about System Entities

Lets begin by discovering system information using puppet's resource shell.

{title="Listing ", lang=html, linenos=off}
~~~~~~~

sudo su
puppet resource user root

[output]

user { 'root':
  ensure           => 'present',
  comment          => 'root',
  gid              => '0',
  home             => '/root',
  password         => '$6$ZAOtewP/A7uXGSX6$G0kAE13DSg8HI8.xwbAH/WlXi1SrNaVhHP713tHbltv0uaHIVN0qwkQGMZbAwxfSIssn2KIDVhz64DB6A95am.',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '0',
}
~~~~~~~

The above command reads from the system about a system entity of type **user** whose name is **root**. As you may have already noticed, this information gets displayed in Puppet's DSL format.

Q> ##  What would happen if you do not provide a name
Q>
Q> of the user as a argument to above command ?  Will it
Q>
Q> throw an error?  Try it and check for yourself.




#### Creating Resources using Puppet Resource Shell
Lets now create a new entity by using Puppet's Reosurce Shell. This time, we would add a user to the system.

{title="Listing ", lang=puppet, linenos=off}
~~~~~~~
puppet resource user abc home='/home/abc' managehome=true

[output]

Notice: /User[abc]/ensure: created
user { 'abc':
  ensure => 'present',
  home   => '/home/abc',
}

~~~~~~~

D> ## You may see **managehome** attribute being used with
D>
D> user resource often. Unless it is provided, the home
D>
D> directory for the user will not be created.
D>
D> Interestingly, if you omit this attribute for the first D>
D> time, and add it later, it will not be considered. This D>
D> is and exception to the converging property of Puppet.  


#### Properties of a Resource - Idempotence

Lets now validate if the user is been created by using resource shell.

{title="Listing ", lang=html, linenos=off}
~~~~~~~
puppet resource user abc

[output]

user { 'abc':
  ensure           => 'present',
  gid              => '501',
  home             => '/home/abc',
  password         => '!!',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '501',
}
~~~~~~~

In addition to the properties we provided earlier, we see that uid, git, password etc is been automatically set. For setting the values of these properties, puppet relies on the system defaults. In fact, puppet translates the resource into a command such as *useradd* or *adduser* which the underlying system understands, and fetches defaults from.


####  Modifying Resources

Lets now modify the user that we created. We would make 3 changes,
1. Add a comment. This typically sets the name/description the of user.
1. Set a password
1. Change shell from bash to sh

To setup password, puppet does not accept plain text, understandbly so as we are writing infrastructure code which would get version controlled. Password must be set using sha1 hash. Lets generate it using openssl

{title="Listing ", lang=html, linenos=off}
~~~~~~~
openssl passwd -1
Password:
Verifying - Password:

[output]
$1$QCir9mgF$sT4HyZ7dEmSzyPNHNvkHk.
~~~~~~~

We would copy the above sha1 string and use it to provide password. To make changes to existing resource, we could  use resource shell directly
e.g.
{title="Listing ", lang=html, linenos=off}
~~~~~~~
puppet resource user abc home='/home/abc' managehome=true uid=601 comment="First Last"
~~~~~~~

However, we would start using puppet's DSL to apply changes.  Lets take a short cut by copying over the output of puppet resource shell and make changes to it.

{title="Listing ", lang=html, linenos=off}
~~~~~~~
puppet resource user abc > abc.pp

[Open abc.pp with an editor such as vim/nano/emacs]

e.g. nano abc.pp
~~~~~~~

T> ## We used .pp extension to the file created above. This
T>
T> is because we are writing puppet's DSL, its own
T>
T> language. Puppet uses .pp similar to .rb or .py used by 
T>
T> ruby and python respectively. 

![Update Existing Reosource](images/chapter4/update_user.jpg)

#### Applying Puppet Code 

Before applying the puppet code written in  abc.pp, lets check it for syntactical correctness, for which, puppet provides a tool called parser, which can be invoked as a subcommand to puppet. 

~~~~~~~
puppet help  parser

USAGE: puppet parser <action>

Interact directly with the parser.

OPTIONS:
  --render-as FORMAT             - The rendering format to use.
  --verbose                      - Whether to log verbosely.
  --debug                        - Whether to log debug information.

ACTIONS:
  dump        Outputs a dump of the internal parse tree for debugging
  validate    Validate the syntax of one or more Puppet manifests.

See 'puppet man parser' or 'man puppet-parser' for full help.
~~~~~~~


To validate sytax, 

```
puppet parser validate abc.pp

[output should be blank]


Lets check the exit code of above command
echo $?

[output]
0
```

If it returns a blank output, its all good. Anything else, and you have broken the syntax.  

e.g. if you ommit a comma at the end of the comment attribute, you would see 

```
# puppet parser validate abc.pp
Error: Could not parse for environment production: Syntax error at 'password' at /home/vagrant/abc.pp:6:3

```

Good habit of puppet is it would almost always point to where the issue is. In above error string it points to abc.pp, line no.6 , column 3.  Which should help you pin point the issue by directly going to this location in the file.  From my experience, the issues could be found a line before this location e.g. line 5 in above case. Puppet proceeds to line 6, and then realizes something is amiss before this point and stops there. 

Now that syntax is validated, its time to apply our changes. Since we are not using Puppet Master to drive changes yet, and since we are making changes locally, lets use stand alone version of puppet, a utility called **apply**, which takes a local .pp file path, reads it and applies locally. 

```
puppet help apply 

puppet apply abc.pp

[output]

Notice: Compiled catalog for master in environment production in 0.04 seconds
Notice: /Stage[main]/Main/User[abc]/comment: comment changed '' to 'First Last'
Notice: /Stage[main]/Main/User[abc]/shell: shell changed '/bin/bash' to '/bin/sh'
Notice: /Stage[main]/Main/User[abc]/password: changed password
Notice: Applied catalog in 0.10 seconds

``` 

Since the user **abc** was already present, puppet did not create it. However, it detected the changes to shell, password and comment and applied those.  

#### Idempotence in Action

Lets run the same command again. 

```
puppet apply abc.pp

[output]
Notice: Compiled catalog for master in environment production in 0.04 seconds
```

This time, it executed super quick, and without making any changes. Wonder why?  Thats idempotence for you, a very important property of puppet. 

Every time invoked, puppet compares between the current state of the resource (e.g. user) with the desired state (e.g. resource properties in abc.pp), and applies changes, only when there is a drift. The second time we invoke with the same code, puppet compares state of the user with the desired state, finds no differnce, and decides to skip. 

T> Idempotence is a important for change management and compliance.  Puppet client runs as a service 
T>
T> invoking itself regularly. In such cases, idempotence not only avoids unneceesary changes, but also 
T> 
T> makes sure the changes are applied when deemed, and only changed resources are updated. Also if you 
T> 
T> are enforcing compliance rules, puppet always makes it a point to bring  systems back to  comliance 
T> 
T> if for any reasons those drift away. 


####  Creating our first Manifest

The file created above i.e. abc.pp qualifies to be a manfest. Manifest is nothing but a collection of resources, along with resource containers such as classes or defined types. We have not yet started looking into resource containers, so for now we will stick to the definition being just **collection of resources** . All manifests have .pp extension.  

We will write our first manifest by hand (not using ready made code given by puppet resource output) with a single file resource with  following specs, 

* Path        : /tmp/hello
* Content     : 'Hello World' 
* Owner       : root
* Permissions : 644 

We have learnt about the sytax which involves writing type, title, attribute and values. The question now could be,

 * which resource should I use to create the file above
 * what is the name of the attribute to set the premission
 * how do I know which resources are available, and where do I seek information on how to use those ?

There are at least 3  ways to find this information. 

1.  Puppet Core Type Cheat Sheet : This is a two page concise document which talks about the most common resources, which attributes those take and the usage. This is available at https://docs.puppet.com/puppet_core_types_cheatsheet.pdf

1.  Puppet Type Reference : This is a comprehensive document which lists all built in resources that come with puppet and detailed usage information. This can be found at https://docs.puppet.com/puppet/latest/reference/type.html

1.  Puppet's Describe Utility: Puppet comes installed with a utility which could show either a consile or a detailed usage document. 


##### Using Puppet Describe 

````
[root@master vagrant]# puppet help describe

puppet-describe(8) -- Display help about resource types
========

SYNOPSIS
--------
Prints help about Puppet resource types, providers, and metaparameters.


USAGE
-----
puppet describe [-h|--help] [-s|--short] [-p|--providers] [-l|--list] [-m|--meta]


OPTIONS
-------
* --help:
  Print this help text

* --providers:
  Describe providers in detail for each type

* --list:
  List all types

* --meta:
  List all metaparameters

* --short:
  List only parameters without detail


EXAMPLE
-------
    $ puppet describe --list
    $ puppet describe file --providers
    $ puppet describe user -s -m

````

Take your time to explore all the options above before starting to write your first resource. 

To write the file resource we intend to , lets create a manifest *local.pp* and write the following code, 

````
file { '/tmp/hello':
  ensure   => file,
  mode     => '0644',
  owner    => 'root,
  content  => "Hello World \n"
}

````

before applying this manifest, lets first check the syntax, 

``` puppet parser validate /vagrant/puppet/local.pp

[output]
Error: Could not parse for environment production: Unclosed quote after "'" followed by 'root,...' at /home/vagrant/local.pp:4:16
```

Yes that was a intentional error. Fix it and make sure the code is syntactically correct.  


This time, we would also do a dry run, before actually applying. Dry run  would tell us what would happen when this code is applied. 

``` puppet apply --noop /vagrant/puppet/local.pp

[output]
Notice: Compiled catalog for master in environment production in 0.06 seconds
Notice: /Stage[main]/Main/File[/tmp/hello]/ensure: current_value absent, should be file (noop)
Notice: Class[Main]: Would have triggered 'refresh' from 1 events
Notice: Stage[main]: Would have triggered 'refresh' from 1 events
Notice: Applied catalog in 0.03 seconds

``` 

Lets now apply changes by removing --noop

```
puppet apply local.pp

[output]

Notice: Compiled catalog for master in environment production in 0.04 seconds
Notice: /Stage[main]/Main/File[/tmp/hello]/ensure: defined content as '{md5}9267511a22ee72ad81ec3e0c674b115e'
Notice: Applied catalog in 0.03 seconds
```

Validate the file is been created with correct properties and permissions

```
[root@master vagrant]# ls -l /tmp/hello
-rw-r--r-- 1 root root 13 May  5 06:50 /tmp/hello

[root@master vagrant]# cat /tmp/hello
Hello World
```


####  Namevars
####  Exercise: Adding a few more resources
1. Create users : xyz, pqr
1. Remove user : abc
1. Install Packages : tree, telnet, nmap

####  Summary


#### Quiz
