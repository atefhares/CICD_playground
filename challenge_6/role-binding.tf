resource "kubernetes_role_binding" "modify-pods-role-binding" {
  metadata {
    name      = "modify-pods-to-sa"
    namespace = var.build_namespace_name
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = "modify-pods-role"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "internal-kubectl"
    namespace = var.build_namespace_name
    api_group = "rbac.authorization.k8s.io"
  }
}
