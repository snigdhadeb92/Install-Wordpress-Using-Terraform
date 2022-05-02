data "aws_vpc" "available_vpc" {
  filter {
    name   = "tag:Name"
    values = ["My_vpc"]
  }
}
data "aws_subnet_ids" "subnet_id_each" {
  vpc_id = data.aws_vpc.available_vpc.id
  filter {
    name   = "tag:Name"
    values = ["public_subnet*"]
  }
}
data "aws_security_group" "sg" {
  filter {
    name   = "tag:Name"
    values = ["my_sg"]
  }
}
data "aws_ami" "amazon_linux_2" {
 most_recent = true
 filter {
   name   = "owner-alias"
   values = ["amazon"]
 }
 filter {
   name   = "name"
   values = ["amzn2-ami-hvm*"]
 }
 owners = ["amazon"]
}
data "template_file" "user_data" {
  template = file("./user-data.sh")
}