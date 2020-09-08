resource "kubernetes_service" "build-namespace-nexus-service" {
  depends_on = [
    kubernetes_deployment.nexus-deployment,
  ]

  metadata {
    name      = "nexus-service-2"
    namespace = var.build_namespace_name
  }
  spec {
    selector = {
      name = var.nexus_pods_lable
    }
    port {
      node_port   = 8083
      port        = 8083
      target_port = 8083
    }

    type = "NodePort"
  }
}
