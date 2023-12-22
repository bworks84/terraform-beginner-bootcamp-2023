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