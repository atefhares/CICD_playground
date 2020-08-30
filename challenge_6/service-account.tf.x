resource "kubernetes_service_account" "internal-kubectl" {
  metadata {
    name = "internal-kubectl"
  }
}
