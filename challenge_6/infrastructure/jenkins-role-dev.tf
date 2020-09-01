resource "kubernetes_role" "jenkins-pods-role-dev" {
  metadata {
    name      = "jenkins-pods-role-dev"
    namespace = var.dev_namespace_name
  }

  rule {
    api_groups = [""]
    resources  = ["pods"]
    verbs      = ["get", "list", "watch", "delete", "create", "update", "patch"]
  }
}
