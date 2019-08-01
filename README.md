# Terraform AWS Subnets
Terraform module which create public and private subnets in an existing VPC.

This module outputs the same variables that [terraform-aws-modules/terraform-aws-vpc](https://github.com/terraform-aws-modules/terraform-aws-vpc) so subnets be fetch in another module using `terraform_remote_state` without worried which module created them.