resource "aws_launch_template" "main" {
  name          = "${local.aws_account_level_id}-eksnodes-${lookup(var.nodes_config, "group_name")}"
  image_id      = lookup(lookup(var.nodes_config, "launch_template"), "ami_id")
  instance_type = lookup(lookup(var.nodes_config, "launch_template"), "instance_type")
  key_name      = lookup(lookup(var.nodes_config, "launch_template"), "key_name", null)
  user_data     = data.template_cloudinit_config.bootstrap.rendered

  network_interfaces {
    associate_public_ip_address = lookup(lookup(var.nodes_config, "launch_template"), "associate_public_ip", false)
    security_groups             = concat([aws_security_group.main.id], var.additional_sg_ids)
    delete_on_termination       = true
  }

  iam_instance_profile {
    name = aws_iam_instance_profile.main.id
  }

  monitoring {
    enabled = lookup(lookup(var.nodes_config, "launch_template"), "monitoring_enabled", false)
  }

  block_device_mappings {
    device_name = "/dev/sda1" # TODO

    ebs {
      delete_on_termination = true
      volume_size           = lookup(lookup(var.nodes_config, "launch_template"), "ebs_volume_size")
      volume_type           = "gp2"
      encrypted             = true
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}
