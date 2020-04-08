data "template_file" "nginx_ec2" {
  template = file("${path.module}/templates/nginx_ec2.cfg")
  vars = {
    nginx1_ec2_private_ip = aws_instance.nginx1.private_ip
    nginx2_ec2_private_ip = aws_instance.nginx2.private_ip
  }
}


resource "null_resource" "ansible_nginx_inventory" {
  triggers = {
    template_rendered = data.template_file.nginx_ec2.rendered
  }
  provisioner "local-exec" {
    command = "echo '${data.template_file.nginx_ec2.rendered}' > ./ansible/nginx_inventory.yml"
  }
}

//--------------------------------------------------------------------------------------

data "template_file" "ssh_config" {
  template = file("${path.module}/templates/ssh_config.cfg")
  vars = {
    bastion_public_ip = aws_instance.bastion.public_ip
  }
}


resource "null_resource" "ssh_config" {
  triggers = {
    template_rendered = data.template_file.ssh_config.rendered
  }
  provisioner "local-exec" {
    command = "echo '${data.template_file.ssh_config.rendered}' > ./ssh_config"
  }
}

//--------------------------------------------------------------------------------------
data "template_file" "gocd_ec2" {
  template = file("${path.module}/templates/gocd_ec2.cfg")
  vars = {
    gocd_ec2_private_ip = aws_instance.gocd.private_ip
  }
}


resource "null_resource" "ansible_gocd_inventory" {
  triggers = {
    template_rendered = data.template_file.gocd_ec2.rendered
  }
  provisioner "local-exec" {
    command = "echo '${data.template_file.gocd_ec2.rendered}' > ./ansible/gocd_inventory.yml"
  }
}


data "template_file" "nexus_ec2" {
  template = file("${path.module}/templates/nexus_ec2.cfg")
  vars = {
    nexus_ec2_private_ip = aws_instance.nexus.private_ip
  }
}


resource "null_resource" "ansible_nexus_inventory" {
  triggers = {
    template_rendered = data.template_file.nexus_ec2.rendered
  }
  provisioner "local-exec" {
    command = "echo '${data.template_file.nexus_ec2.rendered}' > ./ansible/nexus_inventory.yml"
  }
}