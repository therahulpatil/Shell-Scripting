# AWS Resource Listing Script

## Overview  
This Bash script automates the process of listing active AWS resources in a given region. It supports multiple AWS services and helps users quickly retrieve resource details using AWS CLI.

## Supported Services  
- EC2 (Instances)  
- S3 (Buckets)  
- VPC  
- EBS (Volumes)  
- EFS (File Systems)  
- RDS (Databases)  
- Route 53 (Hosted Zones)  
- IAM (Users)  
- Lambda (Functions)  
- SNS (Topics)  

## Prerequisites  
- **AWS CLI Installed**: Ensure AWS CLI is installed. [Install Guide](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)  
- **AWS CLI Configured**: Run `aws configure` to set up credentials.  
- **Bash Shell**: The script runs on Linux/macOS and Git Bash on Windows.  
