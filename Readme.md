# Wordpress deployment exercise on terraform

This project will deploy a vpc and the needed infrastructure for having a running wordpress configured

It will consist on:

        * A VPC with two public and two private subnets and all the needed elements to make it work (routing tables, nat gateways, etc..)
        * An RDS mysql instance database
        * A launch configuration that will define how the instances will be created, including a user-data script for installing apache, php and wordpress
        * Autoscaling group that will launch a minimum of 1 instance
        * ELB to balance the traffic between the instances

Of course, there are a few challenges on this architecture

        * How will wordpress share the content between the different instances to be consistent
                There are two options:
                                * Sharing the application directory between them using EFS
                                * Using s3 as the storage mechanism using wordpress plugins

These challenges i mentioned are not implemented on this exercise.


How to deploy the solution:


Clone the repo

```
git clone <repo_url>
cd <repo_dir>/terraform
terraform get
terraform init
terraform plan
terraform apply -target module.vpc
terraform apply -target module.wp
```



About user data:


All the logic for provisioning the instances resides on a user-data script

That script will do the following tasks:

- Install apache and php
- Install wp-cli, a wordpress command line tool
- Download and configure wordpress
- Install the database if is not already done
- If is the first run, it will delete the wellcome message created automatically by wordpress and create the 'lorem impsum' post.



