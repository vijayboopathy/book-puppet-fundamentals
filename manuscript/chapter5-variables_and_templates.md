# Chapter 05  :  Adding Dynamism  - Variables, Facts and Templates

In the last chapter, we created a simple module to install, configure and start Apache. Even though our code has become modules, its not quiet reusable or sharable as its mostly static. It is not flexible enough for us to create different properties for different nodes.  In this chapter, we are going learn how to refactor the existing code and add some dynamism to it using variable and templates. We will also learn how to discover information about our system using a tool called facter. We will learn about ERB, the template engine that puppet uses, its rule and syntax and how and what to generate templates for. By the end of this chapter, you should have dynamic code with ability to use node specific properties.



  - Problems with Static Content
  - Creating Configurations Dynamically  with Variables and Templates
  - Variables
  - Automatically Discover Node informaiton - Facts
  - Templates and ERB Syntax
    - Files vs Templates
    - Embedding Ruby in a text file using Tags
    - Types of ERB Tags
  - Lab: Create a Template for Apache Configuration
  - Lab: Create a Template for MySQL Configuration
  - Summary
  - Quiz
