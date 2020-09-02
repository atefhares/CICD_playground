resource "kubernetes_role" "jenkins-pods-role-test" {
  metadata {
    name      = "jenkins-pods-role-test"
    namespace = var.test_namespace_name
  }

  rule {
    api_groups = [""]
    resources  = ["*"]
    verbs      = ["*"]
  }
}
