# Input Variables
variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type        = string
  default     = "us-east-1"
}

variable "ec2_ami_id" {
  description = "AMI ID"
  type        = string
  default     = "ami-0c02fb55956c7d316" # Amazon2 Linux AMI ID
}

variable "ec2_instance_count" {
  description = "EC2 Instance Count"
  type        = number
  default     = 1
}

variable "ec2_instance_type" {
  description = "EC2 Instance type"
  type        = string
  default     = "t2.micro"
}

variable "ec2_keypair" {
  description = "EC2 keypair"
  type        = string
  default     = "test-keypair"
}