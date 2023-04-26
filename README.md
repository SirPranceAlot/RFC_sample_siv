# brightwheel_siv
Brightwheel Exercise - Terraform

# Limitations

I had limited testing for this on my personal AWS account.

# High-level Overview of the Implementation 
There are three environments (aws org accounts). There is one module called iam, this module contains the framework to create groups and policies using a for loop to not duplicate resource declarations.

Note that when declaring groups and policies they have to be declared in order. So if you have the group in index 0, the policy for that group has to be in index 0 as well. 
This is a limitation of using for_each in terraform. To change this, we can explicitly declare the policy attachments instead of looping.

Each of the environment uses the iam module so no repeated resource declaration code is needed. You are able to declare unique policies per environment.

The providers.tf files are linked to the provider declaration in the "required_providers" folder. This is to keep providers consistent for each environment.

The root organization is declared separately as it is on a higher level than the environments.

Please see the comments in the code itself, please start by reviewing dev first to get a better context.

- How users of the system are managed 

I didn't create all the permissions policies as that will take a long time, however I gave an example for the frontend-engineering group.
My goal is to allow mostly free access to Dev. QA and prod I view as very similar as far as permissions go so only read permissions
were given as I think write permissions should be in CICD and not belonging to the groups (individuals).

Basically, for each environment are you allowed to create custom policies per group using the same module as a framework.
In theory, we could do an "org wide" policy, but that's not recommended for security purposes.

Anyways, this is what I wrote up off the top of my head real quick, this is not a complete representation for what I can do if given more time and planning.

Thanks all! 

Siv