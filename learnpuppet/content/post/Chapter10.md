+++
date = "2016-08-02T19:48:14+05:30"
draft = true
title = "Shared Library of Infrastructure Code"

+++

With puppet's ability to separate code and configuration data, the declarative code that you write in the form of modules with  puppet becomes generic enough to be shared and be reused. And since this code is in the version control, hosted services such as github offer the perfect means to publish this code. As you start writing code with puppet, you would discover about puppet forge, a library of community written modules. At the time of writing, there are more than 4000 modules available on puppet forge. Similar to a lot of open source code, you need not re invent the wheel. For most open source applications, you would find very sophisticated modules which you could use without even single line change. Download the modules, install it on your own puppet master, add configuration profile, and off you go.
