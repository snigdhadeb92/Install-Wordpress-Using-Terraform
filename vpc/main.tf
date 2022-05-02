################## VPC Creation ###############
resource "aws_vpc" "main" {
  cidr_block       = var.cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support = var.enable_dns_support
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
  }
}

################## Internet Gateway #################
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.igw_tag
  }
}

################ Public Subnet ########################
resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnets_cidr_1
  availability_zone = data.aws_availability_zones.availability_1.names[0]
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = var.public_subnet_tag_1
  }
}
resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnets_cidr_2
  availability_zone = data.aws_availability_zones.availability_1.names[1]
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = var.public_subnet_tag_2
  }
}

################ Database Subnet ########################
resource "aws_subnet" "database_subnet_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.database_subnets_cidr_1
  availability_zone = data.aws_availability_zones.availability_1.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = var.database_subnet_tag_1
  }
}
resource "aws_subnet" "database_subnet_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.database_subnets_cidr_2
  availability_zone = data.aws_availability_zones.availability_1.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = var.database_subnet_tag_2
  }
}

################ Public Route ################
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  #route = []

  tags = {
    Name = var.public_route_table_tag
  }
}
resource "aws_route" "public_internet_gateway" {
  route_table_id            = aws_route_table.public_route_table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

############### Database Route ############
resource "aws_route_table" "database_route_table" {
  vpc_id = aws_vpc.main.id

  #route = []

  tags = {
    Name = var.database_route_table_tag
  }
}

################# Route Table Association with Subnet ################
resource "aws_route_table_association" "public_route_table_association_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "public_route_table_association_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "database_route_table_association_3" {
  subnet_id      = aws_subnet.database_subnet_1.id
  route_table_id = aws_route_table.database_route_table.id
}
resource "aws_route_table_association" "database_route_table_association_4" {
  subnet_id      = aws_subnet.database_subnet_2.id
  route_table_id = aws_route_table.database_route_table.id
}

################## Security Group ####################
resource "aws_security_group" "sg" {
  name        = "my_security_group"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "All Traffic"
    from_port        = 0 #All ports
    to_port          = 0 #All ports
    protocol         = "-1" #All Traffic
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = null
    prefix_list_ids =  null
    security_groups = null
    self = null
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description = "Outbound rule"
    prefix_list_ids =  null
    security_groups = null
    self = null

  }

  tags = {
    Name = "my_sg"
  }
}