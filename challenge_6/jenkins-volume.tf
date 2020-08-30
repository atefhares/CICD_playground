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
      host_path {
        path = "/jenkins-data"
      }
    }
  }
}


resource "kubernetes_persistent_volume_claim" "jenkins-volume-claim" {
  metadata {
    name      = "jenkins-volume-claim"
    namespace = var.build_namespace_name
  }
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
    volume_name = kubernetes_persistent_volume.jenkins-volume.metadata.0.name
  }
}
