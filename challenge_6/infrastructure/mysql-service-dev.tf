resource "kubernetes_service" "dev-namespace-mysql-service" {
  depends_on = [
    kubernetes_deployment.mysql-dev-deployment,
  ]

  metadata {
    name      = "mysql-service"
    namespace = var.dev_namespace_name
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
