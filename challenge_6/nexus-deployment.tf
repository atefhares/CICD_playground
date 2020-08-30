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
