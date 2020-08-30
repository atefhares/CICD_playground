variable "build_namespace_name" {
  type    = string
  default = "build"
}

variable "dev_namespace_name" {
  type    = string
  default = "dev"
}

variable "test_namespace_name" {
  type    = string
  default = "test"
}

variable "jenkins_pods_lable" {
  type    = string
  default = "jenkin2s"
}

variable "nexus_pods_lable" {
  type    = string
  default = "nexus"
}

variable "mysql_pods_lable" {
  type    = string
  default = "mysql"
}

variable "MYSQL_ROOT_PASSWORD" {
  type = string
}

variable "MYSQL_USER" {
  type = string
}

variable "MYSQL_PASSWORD" {
  type = string
}