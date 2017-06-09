# Chapter 02  :  Setting up a Learning Environment

In the previous chapter, we did a quick dive of what Puppet is and its key features such as Centralized Configuration Management, Infrastructure as a Code, Declarative Interface, Shared Library of Code, Integration with other Devops tools etc.  . We also learnt what puppet  is not, who is it for , when to use it etc. 

   - Pre Requisite Softwares
      - VirtualBox
      - Vagrant
      - Editor - Sublime/Atom
      - Git for Windows
      - VM Image/Box

   - Building Environments with Vagrant

   - Creating VMs
       - Puppet Master
       - Web Server - Centos
       - Web Server - Ubuntu
       - Database Server
       - Load Balancer



## Installing and Configuring Puppet Master

On Puppet Master

{title="Listing ", lang=html, linenos=off}
~~~~~~~
sudo su
yum install puppetserver puppet-agent -y

~~~~~~~

Since we are running a scaled down version of puppet server for the lab, we will also need to reduce memory assignment for puppet master.

Edit /etc/sysconfig/puppetserver
and change

``` JAVA_ARGS="-Xms2g -Xmx2g -XX:MaxPermSize=256m" ```

to

``` JAVA_ARGS="-Xms256m -Xmx256m -XX:MaxPermSize=256m" ```

Start Puppet Service

```
service puppetserver start
```

Validate Puppet Server has started by running

```service puppetserver status```

[output]

puppetserver (pid  xxxx) is running...

[possible error]


```
puppetserver dead but pid file exists

Solution:  attempt starting puppetserver again
service puppetserver start

and check the logs at

/var/log/puppetlabs/puppetserver/puppetserver-daemon.log

Logs will point to the possible root cause of service unable to start

```


## Installing Puppet Agent

{title="Listing ", lang=html, linenos=off}
~~~~~~~
sudo su
yum install puppet-agent
service puppet status
service puppet start


Validate
service puppet status
~~~~~~~

 - Master Agent Communication Workflow
 - Log Management on the Master


## Signing Certificates

On agent, invoke puppet run once,

{title="Listing ", lang=html, linenos=off}
~~~~~~~
puppet agent -t
Exiting; no certificate found and waitforcert is disabled
~~~~~~~

On Master, check for outstanding certificate requests
{title="Listing ", lang=html, linenos=off}
~~~~~~~
puppet cert list


[output]

 "web" (SHA256) 74:93:AF:33:2F:38:1F:22:1B:24:09:4A:6E:E8:4F:04:9A:97:1B:95:AE:08:4C:31:FF:DF:13:08:12:25:BA:65


~~~~~~~

To sign all outstanding requests

{title="Listing ", lang=html, linenos=off}
~~~~~~~

puppet cert sign -a
puppet cert list -a

[output]

+ "master" (SHA256) A4:47:5B:04:E2:03:B6:DD:65:20:9E:FB:79:1A:72:06:E7:37:1F:F9:A9:66:A4:FA:7F:DD:8E:C4:7C:F0:17:2B (alt names: "DNS:puppet", "DNS:master")
+ "web"    (SHA256) 21:6B:C8:CA:88:0D:03:BC:43:09:96:0F:60:D9:93:95:56:33:0E:E1:56:E0:23:7D:E2:53:0F:B2:56:D5:1B:EC
~~~~~~~

## Running Puppet Agent one time and as a Service


##Summary

https://gist.github.com/initcron/72bf6bc227f7eef7ba3a
