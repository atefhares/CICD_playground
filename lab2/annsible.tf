data "template_file" "nginx_ec2" {
  template = file("${path.module}/templates/nginx_ec2.cfg")
  vars = {
    nginx1_ec2_public_ip = aws_instance.nginx1.public_ip
  }
}


resource "null_resource" "dev-hosts" {
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