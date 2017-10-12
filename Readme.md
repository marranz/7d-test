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

You will need user with admin o similar permissions on s3. Once you have that, you can create a pair of access/secret keys and put them on a file like this:

```
export AWS_DEFAULT_REGION=<region_name>
export AWS_ACCESS_KEY_ID=<access_key>
export AWS_SECRET_ACCESS_KEY=<secret_key>


export TF_VAR_aws_secret_key=$AWS_SECRET_ACCESS_KEY
export TF_VAR_aws_access_key=$AWS_ACCESS_KEY_ID
export TF_VAR_region=$AWS_DEFAULT_REGION
```

Once the file is ready you can just load it using the source bash command:

`source <file_name`

This will create the needed environment variables for running the project and/or the aws cli with the proper permissions.

After this, you can clone the repo and deploy the solution like this:

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



