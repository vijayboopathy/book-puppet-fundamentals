# Resource Abstraction Layer

We just learnt about puppet allowing us to write the desired state of the infrastructure using a descriptive language. Now  this concept is brought into a reality with the its Domain Specific Language(DSL) which consists of a Resource Abstraction Layer (RAL). Lets describe how this works,

*TODO*: Create an image for each step below.

* Puppet looks at  infrastructure as a collection of entities to manage e.g. package, service, user, network interface etc.
* It then takes the  procedures, the actual logic to manage these entities and  bundles it into something called as **Providers**. Providers are platform specific. That way, each entity may have multiple providers e.g. managing user on linux vs osx vs windows.
* On top of these procedures, puppet creates an abstraction layer. Instead of defining the procedures, it offers the users a simple declarative syntax to define the state of the entity and its properties, in the form of **Resources**.
* Puppet, then does the translation between Resources and Providers, and calls the procedure to put the entity in to the desired state just as described by the user.

This behavior allows the users of the puppet to create policies stating what which entities should be present or absent, with what properties.
