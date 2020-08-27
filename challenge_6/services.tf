resource "kubernetes_service" "build-namespace-jenkins-service" {
  metadata {
    name = "jenkins-service"
  }
  spec {
    selector = {
      app = var.jenkins_pods_lable
    }
    port {
      node_port   = 30001
      port        = 8080
      target_port = 8080
    }

    type = "NodePort"
  }
}
