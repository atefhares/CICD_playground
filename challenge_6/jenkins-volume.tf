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
    persistent_volume_source {
      vsphere_volume {
        volume_path = "/jenkins-data"
      }
    }
  }
}
