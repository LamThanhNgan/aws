# Document structure
- I. Basic setup 
- II. Terraform commands

# I. Basic setup

- Install Terraform CLI
- Install AWS CLI
- Install VS Code Editor
- Install HashiCorp Terraform plugin for VS Code

## 1. Prerequisite
| OS    | Version |
| -------- | ------- |
| Ubuntu  | 22.04.3 LTS    |


## 2. Terraform Install

**Step-01:** Update the system and install `gnupg`, `software-properties-common`, and `curl` packages. 

```sh
$ sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
``` 

**Step-02:** Install the HashiCorp GPG key.
```sh
$ wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
```

**Step-03:** Add the HashiCorp APT repository

```sh
$ echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list > /dev/null
```

**Step-04:** Install Terraform from the new repository. 

```sh
$ sudo apt update -y && sudo apt install terraform
```

**Step-05:** Verify the installation
```sh
$ terraform --version
```

## 3. IDE for Terraform - VS Code Editor
- [Microsoft Visual Studio Code Editor](https://code.visualstudio.com/download)
- [Hashicorp Terraform Plugin for VS Code](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform)


## 4. Install AWS CLI
**Step-01:** Download the installation file
```sh
$ curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
```

**Step-02:** Unzip the package and create a directory named aws under the current directory
```sh
$ unzip awscliv2.zip
```

**Step-03:** Run the install program
```sh
$ sudo ./aws/install
```
**Step-04:** Verify the installation
```sh
$ aws --version
```
**Optional:**  Uninstall AWS CLI
```sh
$ which aws
$ ls -l /usr/local/bin/aws
$ sudo rm /usr/local/bin/aws
$ sudo rm /usr/local/bin/aws_completer
$ sudo rm -rf /usr/local/aws-cli
```
## 5. Configure AWS Credentials 
- **Pre-requisite:** Should have AWS Account.
  - [Create an AWS Account](https://portal.aws.amazon.com/billing/signup?nc2=h_ct&src=header_signup&redirect_url=https%3A%2F%2Faws.amazon.com%2Fregistration-confirmation#/start)
- Generate Security Credentials using AWS Management Console
  - Go to Services -> IAM -> Users -> "Your-Admin-User" -> Security Credentials -> Create Access Key
- Configure AWS credentials using SSH Terminal on your local desktop
```sh
$ aws configure
AWS Access Key ID [None]: <YOUR ACCESS KEY ID>
AWS Secret Access Key: <SECRET KEY> 
Default region name [None]: <region>
Default output format [None]: <type>

# Verify if we are able list S3 buckets
aws s3 ls
```
- Verify the AWS Credentials Profile
```sh
cat $HOME/.aws/credentials 
```

# References
- [Guide: Terraform installation](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

# II. Terraform commands
