# Input Variables
variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type        = string
  default     = "us-east-1"
}

variable "ec2_ami_id" {
  description = "AMI ID"
  type        = string
  default     = "ami-08422" # Amazon2 Linux AMI ID
  validation {
    condition = length(var.ec2_ami_id) > 4 && substr(var.ec2_ami_id, 0, 4) == var.ec2_ami_id
    #condition     = can(regex("^[0-9A-Za-z-]+$", var.ec2_ami_id))
    error_message = "The ec2_ami_id value must be a valid AMI id, starting with \"ami-\"."
  }
}

variable "ec2_instance_count" {
  description = "EC2 Instance Count"
  type        = number
  default     = 1
}

variable "ec2_instance_type" {
  description = "EC2 Instance Type"
  type = string
  default = "t3.micro"
}