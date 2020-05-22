//resource "aws_secretsmanager_secret" "ec2_secret" {
//  name = "ec2_secret"
//}
////
//resource "aws_secretsmanager_secret_version" "ec2_secret_version" {
//  secret_id = aws_secretsmanager_secret.ec2_secret.id
//  secret_string = tls_private_key.ec2_key.private_key_pem
//}