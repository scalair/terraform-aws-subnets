####################
# VPC remote state #
####################
variable "vpc_bucket" {
  description = "Name of the bucket where vpc state is stored"
}

variable "vpc_state_key" {
  description = "Key where the state file of the VPC is stored"
}

variable "vpc_state_region" {
  description = "Region where the state file of the VPC is stored"
}

###########
# Subnets #
###########
variable "aws_subnet_tags" {
  description = "Set of tags to be added to subnets"
  type        = map(string)
  default     = {}
}

variable "aws_subnet_cidr_private" {
  description = "List of CIDR for the private subnets"
  type        = "list"
}

variable "aws_subnet_cidr_public" {
  description = "List of CIDR for the public subnets"
  type        = "list"
}

variable "aws_subnet_availability_zone" {
  description = "List of availibity zone for the subnets."
  type        = "list"
}

variable "aws_subnet_prefix" {
  description = "Prefix for the name of the subnets"
  type        = "string"
}