# AWS EC2 Instance Module
module "ec2_cluster" {   //root module codes
  source                 = "terraform-aws-modules/ec2-instance/aws" //thiis is child module
  version                = "~> 2.0"

  name                   = "my-modules-demo"
  instance_count         = 2

  ami                    = data.aws_ami.amzlinux.id 
  instance_type          = "t2.micro"
  key_name               = "terraform-key"
  monitoring             = true
  vpc_security_group_ids = ["sg-b8406afc"] # Get Default VPC Security Group ID and replace
  subnet_id              = "subnet-4ee95470" # Get one public subnet id from default vpc and replace
  user_data              = file("apache-install.sh") 
  
  tags = {
    Name        = "Modules-Demo"
    Terraform   = "true"
    Environment = "dev"
  }
}

#manam tf website nundi download chesi module ane folder lo pettukunna and tf website nundii direct ga use ceskunna source attr nundi call cheskunna ah particular module nii child mod antam

#eadaitey manam code raskoni a child mod ni call chestamo vatini root modules antam