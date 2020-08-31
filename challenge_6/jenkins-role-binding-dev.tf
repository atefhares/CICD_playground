resource "kubernetes_role_binding" "jenkins-role-binding-dev" {
  metadata {
    name      = "jenkins-role-binding-dev"
    namespace = var.dev_namespace_name
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.jenkins-pods-role-dev.metadata.0.name
  }
  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.jenkins-sa.metadata.0.name
    namespace = var.build_namespace_name
  }
}
