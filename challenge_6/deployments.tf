resource "kubernetes_deployment" "jenkins-deployment" {
  metadata {
    name      = "jenkins-deployment"
    namespace = var.build_namespace_name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        name = var.jenkins_pods_lable
      }
    }

    template {
      metadata {
        labels = {
          name = var.jenkins_pods_lable
        }
      }

      spec {
        container {
          image = "jenkins:latest"
          name  = var.jenkins_pods_lable
          port {
            container_port = 8080
          }
        }
      }
    }
  }
}


# ======================================================

resource "kubernetes_deployment" "nexus-deployment" {
  metadata {
    name      = "nexus-deployment"
    namespace = var.build_namespace_name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        name = var.nexus_pods_lable
      }
    }

    template {
      metadata {
        labels = {
          name = var.nexus_pods_lable
        }
      }

      spec {
        container {
          image = "sonatype/nexus3:latest"
          name  = var.nexus_pods_lable
          port {
            container_port = 8081
          }
        }
      }
    }
  }
}


# ======================================================

resource "kubernetes_deployment" "mysql-dev-deployment" {
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
