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
  default = "jenkins"
}