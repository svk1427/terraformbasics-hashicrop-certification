# Create EC2 Instance
resource "aws_instance" "web" {
  ami = "ami-0889a44b331db0194" # Amazon Linux
  instance_type = "t2.micro"
  tags = {
    "Name" = "prod-server"
  }
  lifecycle {
    prevent_destroy = true # Default is false
  }
}

