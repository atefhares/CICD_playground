resource "kubernetes_deployment" "jenkins-deployment" {
  metadata {
    name      = "jenkins-deployment"
    namespace = [kubernetes_namespace.build-namesapce.metadata.name]
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        name = "jenkins"
      }
    }

    template {
      metadata {
        labels = {
          name = "jenkins"
        }
      }

      spec {
        container {
          image = "jenkins:latest"
          name  = "jenkins"
        }
      }
    }
  }
}
