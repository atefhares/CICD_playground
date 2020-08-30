resource "kubernetes_deployment" "mysql-dev-deployment" {
  depends_on = [
    kubernetes_namespace.dev-namespace,
  ]

  metadata {
    name      = "mysql-deployment"
    namespace = var.dev_namespace_name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        name = var.mysql_pods_lable
      }
    }

    template {
      metadata {
        labels = {
          name = var.mysql_pods_lable
        }
      }

      spec {
        container {
          image = "mysql:latest"
          name  = var.mysql_pods_lable
          port {
            container_port = 3306
          }
          env {
            name  = "MYSQL_USER"
            value = var.MYSQL_USER
          }
          env {
            name  = "MYSQL_PASSWORD"
            value = var.MYSQL_PASSWORD
          }
          env {
            name  = "MYSQL_ROOT_PASSWORD"
            value = var.MYSQL_ROOT_PASSWORD
          }
        }
      }
    }
  }
}
resource "kubernetes_deployment" "mysql-test-deployment" {
  depends_on = [
    kubernetes_namespace.test-namespace,
  ]

  metadata {
    name      = "mysql-deployment"
    namespace = var.test_namespace_name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        name = var.mysql_pods_lable
      }
    }

    template {
      metadata {
        labels = {
          name = var.mysql_pods_lable
        }
      }

      spec {
        container {
          image = "mysql:latest"
          name  = var.mysql_pods_lable
          port {
            container_port = 3306
          }
          env {
            name  = "MYSQL_USER"
            value = var.MYSQL_USER
          }
          env {
            name  = "MYSQL_PASSWORD"
            value = var.MYSQL_PASSWORD
          }
          env {
            name  = "MYSQL_ROOT_PASSWORD"
            value = var.MYSQL_ROOT_PASSWORD
          }
        }
      }
    }
  }
}
