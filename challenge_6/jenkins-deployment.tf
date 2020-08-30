resource "kubernetes_deployment" "jenkins-deployment" {
  depends_on = [
    kubernetes_namespace.build-namespace,
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
        container {
          image = "jenkins/jenkins"
          name  = var.jenkins_pods_lable
          port {
            container_port = 8080
          }

          volume_mount {
            name       = "jenkins-working-dir"
            mount_path = "/var/jenkins_home"
          }
        }

        # init_container {
        #   image   = "debian:latest"
        #   name    = "init-container-1"
        #   command = ["bash", "-c", "apt update && apt install -y curl && curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl"]
        # }

        volume {
          name = "jenkins-working-dir"
          empty_dir {}
        }
      }
    }
  }
}
