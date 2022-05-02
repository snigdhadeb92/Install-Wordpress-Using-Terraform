########## DB subnet group #############
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db_subnet"
  subnet_ids = data.aws_subnet_ids.available_db_subnet.ids

  tags = {
    Name = "My DB subnet group"
  }
}