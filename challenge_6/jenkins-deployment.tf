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

        init_container {
          image   = "debian:latest"
          name    = "init_container_1"
          command = ['sh', '-c', 'RUN apt update && apt install -y curl && curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl']
        }
      }
    }
  }
}
