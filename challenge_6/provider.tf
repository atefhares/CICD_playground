# provider "kubernetes" {
#   config_context_cluster   = "minikube"
# }
provider "kubernetes" {
  config_context = "minikube"
}