############### AWS EC2 configuration ###############
resource "aws_launch_configuration" "lunch_config" {
  name                        = "lunch_config"
  image_id                    = data.aws_ami.amazon_linux_2.id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  security_groups             = [data.aws_security_group.sg.id]
  user_data                   = data.template_file.user_data.rendered
  lifecycle {
    create_before_destroy = true
  }
}
