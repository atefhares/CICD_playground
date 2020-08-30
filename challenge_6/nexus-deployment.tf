resource "kubernetes_deployment" "nexus-deployment" {
  depends_on = [
    kubernetes_namespace.build-namespace,
  ]

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
        volume {
          name = kubernetes_persistent_volume.nexus-volume.metadata.0.name
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.nexus-volume-claim.metadata.0.name
          }
        }

        container {
          image = "sonatype/nexus3:latest"
          name  = var.nexus_pods_lable
          port {
            container_port = 8081
          }

          volume_mount {
            name       = kubernetes_persistent_volume.nexus-volume.metadata.0.name
            mount_path = "/nexus-data"
          }
        }
      }
    }
  }
}
