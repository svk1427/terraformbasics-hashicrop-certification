# Create EC2 Instance
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

resource "aws_instance" "my-ec2-vm" {
  ami               = "ami-047a51fa27710816e"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  key_name = "something"
  #availability_zone = "us-east-1b"
  tags = {
    "Name" = "new-demo"
    #"tag1" = "Update-test-1"    
  }
   root_block_device {
    volume_size = 30 # in GB <<----- I increased this!
    volume_type = "gp2"
    encrypted   = false
  }

}


