+++
date = "2016-08-02T19:48:06+05:30"
draft = true
title = "Device Support"

+++

Managing configurations on systems running common operating systems such as windows, linux, os x, where puppet agent application  can be installed is easy.  Its a completely different beast when it comes to   managing configurations on  devices running their own specialized version of operating systems/firmwares. Examples are configuring CISCO's network switches routers, EMC's storage array.

Along with programmable infrastructures, new concepts such as Software Defined Networking(SDN) and Software Defined Storage(SDS) are taking root and changing the way devices are being managed. Puppet supports managing devices in two ways,

1. Devices that are based on linux and have puppet agent ported to run on those can be configured the same way as other generic systems.
1. Sub set of devices that do not have puppet agent can still be configured with puppet's device support over ssh/telnet. For such devices, puppet uses push instead of pull approach.
