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
        }
      }
    }
  }
}


# ======================================================
