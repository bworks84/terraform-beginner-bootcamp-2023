# Terraform Beginner Bootcamp 2023



## Week 0 Prep

- sign up for terraform cloud. 
- gitpod and git setup. 
- Docker setup. 
- overview of git, branching/merging, issues, etc


#### Semantic Versioning...

This project is going to utilize semantic versioning for its tagging. 
[semver.org](https://semver.org/)

The general format: 

 **MAJOR.MINOR.PATCH**, eg. 1.0.1

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes

## Week 0

### Branch Tagging PR
- Went over git branch, creating issues and new branches with notes for other people to read/understand. 
- Added labels to issues corresponding to the requirements needed

### Considerations for Linux Distro
This project is built against Ubuntu.   Please consider checking your Linux distro and change accordingly to distribution needs. 

https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/

```cat /etc/os-release```

### Install Terraform CLI

#### Considerations with the TF CLI changes
Used Terraform install-cli instructions to write executable script to automate installation. Installation changes were changed due to the gpg keyring changes. So needed to refer to the latest install CLI instructions via documentation and change teh scripting.  

    - [Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli). 

### Refactoring into Bash Scripts
While fixing the TF CLI gpg deprecation issues we noticed that bash scripts were a considerable amount more code. So we decided to create a bash script to install the Terraform CLI

- This will keep the Gitpod Task File tidy. 
- This allows us an easier time debugging and executing manually TF CLI install
- Allows for better portability for other projects

    - [FCC Bash Scripting](https://www.freecodecamp.org/news/bash-scripting-tutorial-linux-shell-script-and-command-line-for-beginners/). 

- updated gitpod.yml tasks with 'before' formatting based on documentation
    - [Gitpod Workspace Documentation](https://www.gitpod.io/docs/configure/workspaces/tasks). 

### Working with Env Vars

#### env command
We can list out all Environment Variables (Env Vars) using the `env` command

We can filter specific env vars using grep. eg `env | grep AWS_`

#### Setting and Unsetting Env Vars

In the terminal we can set using `export HELLO='world'`
In the terminal we can unset using unset HELLO
We can set an env var temporarily when just running a command

```sh
HELLO='world' ./bin/print_message 
```

Within a bash script we can set env without writing export eg

```sh
#!/usr/bin/env bash

HELLO='world'

```

### Printing Vars

We can print an env var using echo eg. `echo $HELLO`

#### Scoping of Env Vars

When you open up new bash terminals in VSCode it will not be aware of env vars that you have set in another window. 

If you want the Env Vars to persist across all future bash terminals that are open you need to set env vars in your bash profile. 

#### Persisting Env Vars in Gitpod

We can persist env vars into gitpod by storing them in Gitpod secrets storage.  

```
gp env HELLO='world'
```

All future workspaces launched will set the env vars for all bash terminals opened in those workspaces. 

`.gitpod.yml` can also contain non-sensitive env vars

### AWS CLI Installation

AWS CLI is installed for the project via the bash script [`./bin/install_aws_cli`](./bin/install_aws_cli). 

[Getting Started Install (AWS CLI)](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html). 

[AWS env vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

To check if our AWS credentials are configured correctly by running the following: 

```aws sts get-caller-identity```

If it is successful you should see a json payload return that looks like this: 

```
{
    "UserId": "123456789101112",
    "Account": "12343559579",
    "Arn": "arn:aws:iam::<accountID>:user/username"
}
```

We'll need to generate AWS CLI credentials from IAM User in order to use the AWS CLI


## Random Terraform Provider Init Plan Apply / Terraform Basics
- https://registry.terraform.io/


### Terraform Registry

Terraform sources their providers and modules from the TF registry which is located at [Terraform Registry.io](https://registry.terraform.io/). 

- Providers is an interface to APIs that will allow to create resources in TF.  
- Modules are a way to make a large amount of TF code modular, portable, and shareable. 

[Random Terraform Provider](https://registry.terraform.io/providers/hashicorp/random/)

#### Terraform Console

We can see a list of all the TF commands by simply typing `terraform`

#### Terraform Init

`terraform init`

At the start of a new TF project we will run `terraform init` to download the binaries that we will use

#### Terraform Plan

`terraform plan`

This will generate out a changeset, about the state of our infrastructure and what will be changed

We can output this changeset "plan" to be passed to an apply, but often you can just ignore outputting. 

#### Terraform Apply

`terraform apply`

This will run a plan and pass the changeset to be executed by TF. Apply should prompt yes or not. 

If we want to automatically approve an apply we can provide the auto approve flag eg `terraform apply --auto-approve`

#### Terraform Destroy

`terraform destroy`

This will destroy all resources created with terraform apply. --auto-approve can be used with this command

#### Terraform Lock Files

`.terraform.lock.hcl` contains the locked versioning for the providers or modules that should be used with this project

The TF Lock File should be committed to you VSC eg. Github

#### Terraform State Files

`.terraform.tfstate` contain information about the current state of your infrastructure. 

This file **should not be committed** to your VCS. This file can contain sensitive data . If you lose this file you lose the state of your infrastructure.  

`.terraform.tfstate.backup` is the previous state file state.  

#### Terraform Directory

`.terraform` directory contains binaries of terraform providers.  


## Issues with Terraform Cloud Login and Gitpod Workspace
When attempting to run `terraform login` it will launch bash a wiswig view to a generate a token. However it does not work as expected in Gitpod VSCode in the browser. 

The workaround is manually generate a token in TF Cloud.  *Pasting the TF Cloud token into the CLI does not show that it is pasted in, but upon pressing enter, it will login to Terraform Cloud with your credentials. 

Then create the file manually here:
```
sh
touch /home/gitpod/.terraform.d/credentials.tfrc.json
open /home/gitpod/.terraform.d/credentials.tfrc.json

```

Provide the following code (replace with your token in the file):

```json
{
    "credentials": {
        "app.terrform.io": {
            "token": "YOUR TERRAFORM CLOUD TOKEN"
        }
    }
}
```

We have automated this workaround with the following bash script [bin/generate_tfrc_credentials](bin/generate_tfrc_credentials)
*Follow along videos were presented out of order, so I have made branch 16, instead of 15 in Andrew's tutorial