# Resource-9: Create Elastic IP
resource "aws_eip" "my-eip" {
  instance = aws_instance.my-ec2-vm.id
  vpc      = true
  # Meta-Argument
  depends_on = [aws_internet_gateway.vpc-dev-igw]
}
#EIP may require IGW to exist prior to association. Use depends_on to set an explicit dependency on the IGW.
#here eip allocate avvali antey mundu igw vpc attach aie vundali adhi jarigina tarvata eip create avutadi.
#ekkada resB antey eip and resA antey igw, resA create ayyaka matrame resB create avuthundi.

#automatically provider dependencies are there and explicit dependecies are there
#APD means genearally it comes along with terraform like in ec2 instance creation public ip will be assign once the ec2 created
#but ED is manually depends on meta arg will deceide to create resB depends on resA like above 3 lines
