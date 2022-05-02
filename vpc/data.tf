############### Availability Zone ############
data "aws_availability_zones" "availability_1" {
  state = "available"
} 