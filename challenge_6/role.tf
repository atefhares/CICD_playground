resource "kubernetes_role" "modify-pods-role" {
  metadata {
    name = "modify-pods-role"
    labels = {
      test = "MyRole"
    }
    namespace = var.build_namespace_name
  }

  rule {
    api_groups = [""]
    resources  = ["pods"]
    verbs      = ["get", "list", "watch", "delete", "create", "update", "patch"]
  }
}
