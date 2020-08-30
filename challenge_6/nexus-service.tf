resource "kubernetes_service" "build-namespace-nexus-service" {
  metadata {
    name      = "nexus-service"
    namespace = var.build_namespace_name
  }
  spec {
    selector = {
      name = var.nexus_pods_lable
    }
    port {
      node_port   = 30002
      port        = 8081
      target_port = 8081
    }

    type = "NodePort"
  }
}
