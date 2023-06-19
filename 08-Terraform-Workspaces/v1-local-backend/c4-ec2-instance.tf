# Create EC2 Instance - Amazon Linux
resource "aws_instance" "my-ec2-vm" {
  ami           = data.aws_ami.amzlinux.id 
  instance_type = var.instance_type
  key_name      = "newkey"
  count = terraform.workspace == "default" ? 1 : 2 //means if workspace is default then create 1 server otherwise  create 2 servers
	user_data = file("apache-install.sh")           
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "Name" = "vm-${terraform.workspace}-${count.index+1}"
  }
}




