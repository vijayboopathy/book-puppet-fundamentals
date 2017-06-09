#  Chapter 04  :  Creating Reusable Code - Modules

In the last chapter we learnt how to write simple manifests with a few  resources. In this chapter we are going to introduce you to the concept of modules, a package to organize and distribute manifests along with supporting files to automate piece of your infrastructure. While learning about the modules, we will learn about module structure, concept of classes, class naming conventions, meta parameters for ordering etc. We will also learn how to define the mapping between the nodes being managed and configurations those would apply through node definitions. By the time you are done with this chapter you should have a simple, static module created for a web server.  

  - Problems with Single Manifests
  - Reusable Code - Modules
  - Modules Layout
  - Metadata
  - Manifest in Modules and Classes
  - Manifest Naming Schemes
  - Lab: Create Apache Install Manifest
    - Generate Module Layout
    - Write install.pp
    - Write service.pp
  - Ordering and Meta Parameters
    - need for ordering
    - simple ordering
      - before
      - require
    - ordering with notification
      - notify
      - subscribe
    - resource chaining
    - why these are called  meta parameters
    - list of other meta parameters
  - Exercise: Create a module to install MySQL Server
  - Summary
  - Quiz

  #  Chapter 06  :  Managing Multiple Nodes - Node Classifications
     - Multiple Nodes
     - Node Classifiers
       - Node Declarations
       - ENC
       - Hiera (using hiera_include functions)
     - Lab: Creating Node Declarations for Apache
     - Exercise: Creating Node Declarations for MySQL
     - Summary
     - Quiz
