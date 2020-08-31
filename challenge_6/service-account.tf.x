resource "kubernetes_service_account" "internal-kubectl" {
  metadata {
    name      = "internal-kubectl"
    namespace = var.build_namespace_name
  }
}
