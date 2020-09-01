resource "kubernetes_service_account" "jenkins-sa" {
  metadata {
    name      = "jenkins-sa"
    namespace = var.build_namespace_name
  }
}
