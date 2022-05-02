############### AWS target group #############
resource "aws_lb_target_group" "EC2_target_group" {
  name     = "EC2-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.available_vpc.id
}