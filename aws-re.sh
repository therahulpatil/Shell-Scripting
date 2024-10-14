#!/bin/bash

#------------------------------------------------------------------------
# Author : Rahul Patil
# Version : v0.1
# This script automates the process of listing active AWS resources in an account
#------------------------------------------------------------------------

# Supported services:
# EC2, S3, VPC, EBS, EFS, RDS, Route 53, IAM, Lambda, SNS

# Usage: ./aws-resource-list.sh <aws-region> <aws-service>
# Example: ./aws-resource-list.sh ap-south-1 ec2

#------------------------------------------------------------------------

# Check AWS CLI Installation
if ! command -v aws &> /dev/null 
then
  echo "AWS CLI is not installed. Please install AWS CLI."
  exit 1
fi

# Check AWS CLI Configuration
if [ ! -d ~/.aws ] 
then 
  echo "AWS CLI is not configured. Please configure AWS CLI." 
  exit 1 
fi

# Check if the required arguments are passed
if [ $# -ne 2 ]
then
  echo "Please pass appropriate arguments."
  echo "Usage: ./aws-resource-list.sh <aws-region> <aws-service>"
  exit 1
fi

# Assign arguments to variables
aws_region=$1
aws_service=$2

# List resources based on the service
echo "Listing $aws_service resources in $aws_region region."

case $aws_service in 
  ec2)
    aws ec2 describe-instances --region $aws_region
    ;;
  s3)
    aws s3api list-buckets --region $aws_region
    ;;
  vpc)
    aws ec2 describe-vpcs --region $aws_region
    ;;
  ebs)
    aws ec2 describe-volumes --region $aws_region
    ;;
  efs)
    aws efs describe-file-systems --region $aws_region
    ;;
  rds)
    aws rds describe-db-instances --region $aws_region
    ;;
  route53)
    aws route53 list-hosted-zones
    ;;
  iam)
    aws iam list-users
    ;;
  lambda)
    aws lambda list-functions --region $aws_region
    ;;
  sns)
    aws sns list-topics --region $aws_region
    ;;
  *)
    echo "Invalid service. Please enter a valid service (ec2, s3, vpc, etc.)."
    exit 1
    ;;
esac
