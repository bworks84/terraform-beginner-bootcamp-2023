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