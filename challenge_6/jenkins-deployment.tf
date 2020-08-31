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
        service_account_name            = kubernetes_service_account.jenkins-sa.metadata.0.name
        automount_service_account_token = "true"
        security_context {
          fs_group = 1000
        }

        volume {
          name = kubernetes_persistent_volume.jenkins-volume.metadata.0.name
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.jenkins-volume-claim.metadata.0.name
          }
        }

        volume {
          name = "kubectl"
          empty_dir {}
        }
        # volume {
        #   name = "docker"
        #   empty_dir {}
        # }

        volume {
          name = "docker-sock"
          host_path {
            path = "/var/run/docker.sock"
          }
        }

        volume {
          name = "docker"
          host_path {
            path = "/usr/bin/docker"
          }
        }

        container {
          image = "jenkins/jenkins"
          name  = var.jenkins_pods_lable
          port {
            container_port = 8080
          }

          command = ["bash", "-c", "apt-get update -y && apt-get install python-pip -y && pip install ansible"]

          volume_mount {
            name       = kubernetes_persistent_volume.jenkins-volume.metadata.0.name
            mount_path = "/var/jenkins_home"
          }

          volume_mount {
            name       = "kubectl"
            mount_path = "/usr/local/bin/kubectl"
          }
          volume_mount {
            name       = "docker"
            mount_path = "/usr/bin/docker"
          }

          volume_mount {
            name       = "docker-sock"
            mount_path = "/var/run/docker.sock"
          }
        }

        init_container {
          image   = "jenkins/jenkins"
          name    = "init-container-install-kubectl"
          command = ["bash", "-c", "apt update && apt install -y curl && curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl"]
          volume_mount {
            name       = "kubectl"
            mount_path = "/usr/local/bin/kubectl"
          }
        }

        # init_container {
        #   image   = "ubuntu"
        #   name    = "init-container-install-docker"
        #   command = ["bash", "-c", "apt-get update -y && apt install -y apt-transport-https ca-certificates curl software-properties-common && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable' && apt-get update -y && apt-get install -y docker-ce docker-ce-cli containerd.io"]
        #   volume_mount {
        #     name       = "docker"
        #     mount_path = "/usr/bin/docker"
        #   }
        # }
      }
    }
  }
}
