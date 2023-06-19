# Resources Block
# Resource-1: Create VPC
resource "aws_vpc" "vpc-dev" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "vpc-dev"
  }
}

# Resource-2: Create Subnets
resource "aws_subnet" "vpc-dev-public-subnet-1" {
  vpc_id                  = aws_vpc.vpc-dev.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}

# Resource-3: Internet Gateway
resource "aws_internet_gateway" "vpc-dev-igw" {
  vpc_id = aws_vpc.vpc-dev.id
}

# Resource-4: Create Route Table
resource "aws_route_table" "vpc-dev-public-route-table" {
  vpc_id = aws_vpc.vpc-dev.id
}

# Resource-5: Create Route in Route Table for Internet Access
resource "aws_route" "vpc-dev-public-route" {
  route_table_id         = aws_route_table.vpc-dev-public-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc-dev-igw.id
}

# Resource-6: Associate the Route Table with the Subnet
resource "aws_route_table_association" "vpc-dev-public-route-table-associate" {
  route_table_id = aws_route_table.vpc-dev-public-route-table.id
  subnet_id      = aws_subnet.vpc-dev-public-subnet-1.id
}

# Resource-7: Create Security Group
resource "aws_security_group" "dev-vpc-sg" {
  name        = "dev-vpc-default-sg"
  description = "Dev VPC Default Security Group"
  vpc_id      = aws_vpc.vpc-dev.id

  ingress {
    description = "Allow Port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all IP and Ports Outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# #AWS 3-tier archietecture
# resource "aws_vpc" "vpc-prod" {
#   cidr_block       = "10.0.0.0/16"
#   instance_tenancy = "default"

#   tags = {
#     Name = "vpc-prod"
#   }
# }

# resource "aws_subnet" "vpc-prod-publicweb-subnet1" {
#   vpc_id     = aws_vpc.vpc-prod.id
#   cidr_block = "10.0.1.0/24"

#   tags = {
#     Name = "vpc-prod-publicweb-subnet1"
#   }
# }

# resource "aws_subnet" "vpc-prod-publicweb-subnet2" {
#   vpc_id     = aws_vpc.vpc-prod.id
#   cidr_block = "10.0.2.0/24"

#   tags = {
#     Name = "vpc-prod-publicweb-subnet2"
#   }
# }

# resource "aws_subnet" "vpc-prod-privateapp-subnet1" {
#   vpc_id     = aws_vpc.vpc-prod.id
#   cidr_block = "10.0.3.0/24"

#   tags = {
#     Name = "vpc-prod-privateapp-subnet1"
#   }
# }

# resource "aws_subnet" "vpc-prod-privateapp-subnet2" {
#   vpc_id     = aws_vpc.vpc-prod.id
#   cidr_block = "10.0.4.0/24"

#   tags = {
#     Name = "vpc-prod-privateapp-subnet2"
#   }
# }
# resource "aws_subnet" "vpc-prod-privatedb-subnet1" {
#   vpc_id     = aws_vpc.vpc-prod.id
#   cidr_block = "10.0.5.0/24"

#   tags = {
#     Name = "vpc-prod-privatedb-subnet3"
#   }
# }
# resource "aws_subnet" "vpc-prod-privatedb-subnet2" {
#   vpc_id     = aws_vpc.vpc-prod.id
#   cidr_block = "10.0.6.0/24"

#   tags = {
#     Name = "vpc-prod-privatedb-subnet4"
#   }
# }
# #Routetables
# resource "aws_route_table" "mypublicwebRT" {
#   vpc_id = aws_vpc.vpc-prod.id

#   tags = {
#     Name = "mypublicwebRT"
#   }
# }
# resource "aws_route_table" "myprivateappRT" {
#   vpc_id = aws_vpc.vpc-prod.id

#   tags = {
#     Name = "myprivateappRT"
#   }
# }
# resource "aws_route_table" "myprivatedbRT" {
#   vpc_id = aws_vpc.vpc-prod.id

#   tags = {
#     Name = "myprivatedbRT"
#   }
# }

# #Associate the Route Table with the public Web Subnet
# resource "aws_route_table_association" "vpc-webpublic-subnetassoc1" {
#   subnet_id      = aws_subnet.vpc-prod-publicweb-subnet1.id
#   route_table_id = aws_route_table.mypublicwebRT.id
# }

# resource "aws_route_table_association" "vpc-webpublic-subnetassoc2" {
#   subnet_id      = aws_subnet.vpc-prod-publicweb-subnet2.id
#   route_table_id = aws_route_table.mypublicwebRT.id
# }

# #Associate the Route Table with the private app Subnet
# resource "aws_route_table_association" "vpc-appprivate-subnetassoc3" {
#   subnet_id      = aws_subnet.vpc-prod-privateapp-subnet1.id
#   route_table_id = aws_route_table.myprivateappRT.id
# }

# resource "aws_route_table_association" "vpc-appprivate-subnetassoc4" {
#   subnet_id      = aws_subnet.vpc-prod-privateapp-subnet2.id
#   route_table_id = aws_route_table.myprivateappRT.id
# }
# #Associate the Route Table with the privateDB Subnet
# resource "aws_route_table_association" "vpc-dbprivate-subnetassoc5" {
#   subnet_id      = aws_subnet.vpc-prod-privatedb-subnet1.id
#   route_table_id = aws_route_table.myprivatedbRT.id
# }

# resource "aws_route_table_association" "vpc-dbprivate-subnetassoc6" {
#   subnet_id      = aws_subnet.vpc-prod-privatedb-subnet2.id
#   route_table_id = aws_route_table.myprivatedbRT.id
# }

# #Route tables

# # Resource-3: Internet Gateway
# resource "aws_internet_gateway" "myIGW" {
#   vpc_id = aws_vpc.vpc-prod.id

#   tags = {
#     Name = "myIGW"
#   }
# }
# #attach IGW to vpc

# resource "aws_internet_gateway_attachment" "igw_attach_vpc" {
#   internet_gateway_id = aws_internet_gateway.myIGW.id
#   vpc_id              = aws_vpc.vpc-prod.id
# }

# #create NAT gateway
# resource "aws_nat_gateway" "mynatgw" {
#   allocation_id = aws_eip.mynat_eip.id
#   subnet_id     = aws_subnet.vpc-prod-publicweb-subnet1.id

#   tags = {
#     Name = "mynatgw"
#   }

#   # To ensure proper ordering, it is recommended to add an explicit dependency
#   # on the Internet Gateway for the VPC.
#   depends_on = [aws_internet_gateway.myIGW]
# }

# #assign EIP for NATGW
# resource "aws_eip" "mynat_eip" {
#   vpc = true

#   tags = {
#     Name = "mynat_eip"
#   }
# }

# #setup and give internetgw access to publicweb route

# resource "aws_route" "routetopublic" {
#   route_table_id            = aws_route_table.mypublicwebRT.id
#   destination_cidr_block    = "0.0.0.0/0"
#   gateway_id                = aws_internet_gateway.myIGW.id
#   depends_on                = [aws_route_table.mypublicwebRT]
# }

# #setup and give natgw access to privateapp route

# resource "aws_route" "routetoprivate" {
#   route_table_id            = aws_route_table.myprivateappRT.id
#   destination_cidr_block    = "0.0.0.0/0"
#   nat_gateway_id            = aws_nat_gateway.mynatgw.id
#   depends_on                = [aws_route_table.mypublicwebRT]
# }

# #Not give any internet access to DB subnets/routes bcs db always in secure mode

