\# AWS Dev Environment with Terraform



This repository contains Terraform code to provision a development environment on AWS.  

It includes VPC, EC2, and Security Group configuration with dynamic IP handling for SSH access.



\---



\## Prerequisites



\- \*\*Terraform\*\* v1.3+ installed  

\- \*\*AWS CLI\*\* installed (optional but recommended)  

\- \*\*IAM user credentials\*\* (Access Key + Secret Key) with required permissions:

&#x20; - `AmazonEC2FullAccess`

&#x20; - `AmazonVPCFullAccess`

&#x20; - `IAMReadOnlyAccess` (optional, for inspection)



\---



\## AWS Credentials Setup



Terraform requires AWS credentials to authenticate.  

You can provide them via the \*\*credentials file\*\* or \*\*environment variables\*\*.



\### Option 1: AWS Credentials File (Recommended)



\*\*Linux/MacOS\*\*

```bash

mkdir -p \~/.aws

nano \~/.aws/credentials



\*\*Windows Powershell\*\*



mkdir $env:USERPROFILE\\.aws

notepad $env:USERPROFILE\\.aws\\credentials

