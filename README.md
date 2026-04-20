# AWS Dev Environment with Terraform



This repository contains Terraform code to provision a development environment on AWS.

It includes VPC, EC2, and Security Group configuration with dynamic IP handling for SSH access.





## Prerequisites



**Terraform** v1.3+ installed

**AWS CLI** installed (optional but recommended)

**IAM user credentials** (Access Key + Secret Key) with required permissions:

AmazonEC2FullAccess
AmazonVPCFullAccess
IAMReadOnlyAccess (optional, for inspection)







## AWS Credentials Setup



Terraform requires AWS credentials to authenticate.

You can provide them via the **credentials file** or **environment variables**.



### 

### AWS Credentials File



**Linux/MacOS**



mkdir -p \~/.aws
nano \~/.aws/credentials



**Windows Powershell**



mkdir $env:USERPROFILE\\.aws



notepad $env:USERPROFILE\\.aws\\credentials



### 

### Environment variable



**You can also export credentials directly**:



Linux/MacOS

export AWS\_ACCESS\_KEY\_ID=YOUR\_ACCESS\_KEY

export AWS\_SECRET\_ACCESS\_KEY=YOUR\_SECRET\_KEY

export AWS\_DEFAULT\_REGION=(required\_region)





Windows (PowerShell)

setx AWS\_ACCESS\_KEY\_ID "YOUR\_ACCESS\_KEY"

setx AWS\_SECRET\_ACCESS\_KEY "YOUR\_SECRET\_KEY"

setx AWS\_DEFAULT\_REGION "(required\_region)"







#### SSH Keypair Setup





**Terraform uses an AWS key pair to enable SSH access to the EC2 instance.**



**Generate a key pair locally** (if you don’t already have one):





Linux/MacOS



&#x20;  ssh-keygen -t rsa -b 4096 -f \~/.ssh/devKey





Windows Powershell



&#x20;  ssh-keygen -t rsa -b 4096 -f $env:USERPROFILE\\.ssh\\devKey





**Modify the public key value in ec2.tf to match the path of the generated key.**

