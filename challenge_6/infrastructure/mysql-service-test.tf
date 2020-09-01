resource "kubernetes_service" "test-namespace-mysql-service" {
  depends_on = [
    kubernetes_deployment.mysql-deployment,
  ]

  metadata {
    name      = "mysql-service"
    namespace = var.test_namespace_name
  }
  spec {
    selector = {
      name = var.mysql_pods_lable
    }
    port {
      port = 3306
    }
  }
}
