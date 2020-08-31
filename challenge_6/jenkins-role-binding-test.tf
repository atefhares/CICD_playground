resource "kubernetes_role_binding" "jenkins-role-binding-test" {
  metadata {
    name      = "jenkins-role-binding-test"
    namespace = var.test_namespace_name
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.jenkins-pods-role-test.metadata.0.name
  }
  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.jenkins-sa.metadata.0.name
    namespace = var.build_namespace_name
  }
}
