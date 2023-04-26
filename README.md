# brightwheel_siv
Brightwheel Exercise - Terraform

# Limitations

 

# High-level Overview of the Implementation 
There are three environments (aws org accounts). There is one module called iam, this module contains the framework to create groups and policies using a for loop to not duplicate resource declarations.

Note that when declaring groups and policies they have to be declared in order. So if you have the group in index 0, the policy for that group has to be in index 0 as well. 
This is a limitation of using for_each in terraform. To change this, we can explicitly declare the policy attachments instead of looping.

Each of the environment uses the iam module so no repeated resource declaration code is needed. You are able to declare unique policies per environment.

The providers.tf files are linked to the provider declaration in the "required_providers" folder. This is to keep providers consistent for each environment.

The root organization is declared separately as it is on a higher level than the environments.

Please see the comments in the code itself, please start by reviewing dev first to get a better context.

- How users of the system are managed 

