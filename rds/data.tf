data "aws_vpc" "available_vpc" {
  filter {
    name   = "tag:Name"
    values = ["My_vpc"]
  }
}

data "aws_subnet_ids" "available_db_subnet" {
  vpc_id = data.aws_vpc.available_vpc.id
  filter {
    name   = "tag:Name"
    values = ["database_subnet*"]
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_security_group" "sg" {
  filter {
    name   = "tag:Name"
    values = ["my_sg"]
  }
}