resource "kubernetes_deployment" "jenkins-deployment" {
  depends_on = [
    kubernetes_namespace.build-namespace,
    kubernetes_persistent_volume.jenkins-volume,
  ]

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
        security_context {
          fs_group = 1000
        }
        
        volume {
          name = kubernetes_persistent_volume.jenkins-volume.metadata.0.name
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.jenkins-volume-claim.metadata.0.name
          }
        }

        container {
          image = "jenkins/jenkins"
          name  = var.jenkins_pods_lable
          port {
            container_port = 8080
          }

          volume_mount {
            name       = kubernetes_persistent_volume.jenkins-volume.metadata.0.name
            mount_path = "/"
          }
        }

        # init_container {
        #   image   = "debian:latest"
        #   name    = "init-container-1"
        #   command = ["bash", "-c", "apt update && apt install -y curl && curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl"]
        # }
      }
    }
  }
}
