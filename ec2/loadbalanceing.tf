################### Load balancer ################
resource "aws_lb" "my_load_balancer" {
  name               = "my-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.aws_security_group.sg.id]
  # At least two different subnet 
  subnets            = data.aws_subnet_ids.subnet_id_each.ids

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}