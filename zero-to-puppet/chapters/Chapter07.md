# Convergence and Idempotence

Puppet reads the resources, calls the relevant providers for the platform it runs on, and ensures the desired state of the resource is achieved. While it does so, it may need to make changes to the system. But what if the resource has already achieved the desired state and needs no further updates?  Puppet has the  built in intelligence to know what is the current state of the resource is. Instead of making changes blindly, it first compares the current state of the resource with the desired state, and the makes a decision whether it requires any changes, and if yes, what changes to make.  This process is called as convergence.

*TODO*: Draw diagrams, maybe just a flowchart

e.g.

Lets assume we have written a resource to create  a user  with a password.

```
user{'xyz':
  uid       =>  '501',
  gid       =>  '501',
  home      =>  '/home/xyz',
  password  =>  '$1$foYKL0zO$elXbUOb/JjHqS4aI8O25i.'
}
```

*  First time puppet applies this resource on the system, the user may not exist. Puppet detects the current state, compares it with the desired state which mentions it should exist, and finds the configuration drift. It then creates the user with the password to bring the current state to desired state.

* Lets assume we run puppet again to apply the same resource. This time too it will compare the desired state with current state. Since the user is already present with the password provided, it deems no changes necessary. Instead of attempting to create the user again, it will skip the resource and move on to the next one.

* Lets assume we updated the password information for the user in our code description of the resource, and excute puppet. This time, while comparing the current state with desired state, it detects that the user is present, but the password is updated. It does not attempt to create a user, but only changes one property i.e. password.

Idempotence is a useful property to  ensures that puppet maintains the state of the infrastructure such that its always  in the policy. This also makes change management easier as one could keep running puppet as a service which invokes itself at regular intervals, pulls the changes, and apply only what is changed.
