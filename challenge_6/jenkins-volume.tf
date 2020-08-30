resource "kubernetes_persistent_volume" "jenkins-volume" {
  depends_on = [
    kubernetes_namespace.build-namespace,
  ]

  metadata {
    name = "jenkins-volume"
  }
  spec {
    capacity = {
      storage = "2Gi"
    }
    access_modes = ["ReadWriteMany"]
    host_path {
      path = "/jenkins-data"
    }
  }
}
