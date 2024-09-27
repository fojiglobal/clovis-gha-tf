resource "aws_launch_template" "lt" {
  name = "${var.env}-lt"

  image_id = var.ami_id #"ami-085f9c64a9b75eed5"

  instance_initiated_shutdown_behavior = "terminate"

  instance_type = var.instance_type #"t2.micro"

  key_name = var.instance_key #"cs2-use2-main"

  vpc_security_group_ids = [aws_security_group.private_sg.id]

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.env}-web"
    }
  }

  user_data = var.user_data 
}

################# ASG ############################

resource "aws_autoscaling_group" "asg" {
  name                = "${var.env}-asg"
  vpc_zone_identifier = [for subnet in aws_subnet.private_subnets : subnet.id]
  max_size            = var.max_size
  min_size            = var.min_size
  target_group_arns = [aws_lb_target_group.tgw.arn]
  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }
  tag {
    key                 = "name"
    value               = "${var.env}-web"
    propagate_at_launch = true
  }
}

