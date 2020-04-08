data "template_file" "nginx_ec2" {
  template = file("${path.module}/templates/nginx_ec2.cfg")
  vars = {
    nginx1_ec2_public_ip = aws_instance.nginx1.public_ip
    bastion_public_ip = aws_instance.bastion.public_ip
  }
}


resource "null_resource" "ansible_inventory" {
  triggers = {
    template_rendered = data.template_file.nginx_ec2.rendered
  }
  provisioner "local-exec" {
    command = "echo '${data.template_file.nginx_ec2.rendered}' > ./ansible/nginx_inventory.yml"
  }

//  provisioner "local-exec" {
//    command = "sleep 30; export ANSIBLE_HOST_KEY_CHECKING=False; ansible-playbook -i ./ansible/nginx_inventory.yml ./ansible/playbook.yml --key-file=./private_key.pem"
//  }
}

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