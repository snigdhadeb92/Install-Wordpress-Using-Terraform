############ Auto Scaling Group ###########
resource "aws_autoscaling_group" "my_asg" {
  name                 = "my_asg"
  max_size             = var.max_size
  min_size             = var.min_size
  desired_capacity     = var.desired_capacity
  launch_configuration = aws_launch_configuration.lunch_config.name
  vpc_zone_identifier  = data.aws_subnet_ids.subnet_id_each.ids
  target_group_arns    = [aws_lb_target_group.EC2_target_group.arn]
  tag {
    key                 = "Name"
    value               = "wordpress_installation"
    propagate_at_launch = true
  }

  depends_on = [
    aws_lb_target_group.EC2_target_group
  ]
}