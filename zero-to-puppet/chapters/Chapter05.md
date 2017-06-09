# Declarative vs Procedural Approach

Scripts take a procedural approach towards automation. With scripts, we focus on the **how** part. e.g. how to install a package, how to create a user, how to modify it later, how to do it on a specific platform. And if you would want to add a support for another platform, you may have to add additional procedure and write a conditional to check for the platform and call the relevant code. This involves a lot of efforts.

On the other hand, Puppet takes a declarative approach towards automation. With Puppet, our focus changes from   **how** part to **what**. Instead of writing procedures, we start using a simple declarative syntax to define the desired state of infrastructure.  Let me explain this with an analogy.

Lets say we want to build a house. When we  set out to do so, we hire a contractor, who in turns has a team of construction workers who know how to build it brick by brick. They do all the hard work to bring our house into a reality. Thats the *how* part.

On the other hand, you have a Architect. Lets take a moment and think about what he or she does. An Architect creates a plan, a blue print, which is nothing but a description of how your house should look like. The architect envisions the end state of your house, thinks about *what* should it consists of, breaks it down into components,  and starts creating  specification for each. He would then stitch it together to create a blueprint of our house, and hands it to the contractor to go and build it. This is the how part.

Thats exactly what we would start doing with puppet, only difference being, we write the specification for desired state of IT infrastructure.
