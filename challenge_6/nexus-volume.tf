resource "kubernetes_persistent_volume" "nexus-volume" {
  depends_on = [
    kubernetes_namespace.build-namespace,
  ]

  metadata {
    name = "nexus-volume"
  }
  spec {
    capacity = {
      storage = "2Gi"
    }
    access_modes = ["ReadWriteMany"]
    persistent_volume_source {
      host_path {
        path = "/nexus-data"
      }
    }
    storage_class_name = "standard"
  }
}


resource "kubernetes_persistent_volume_claim" "nexus-volume-claim" {
  metadata {
    name      = "nexus-volume-claim"
    namespace = var.build_namespace_name
  }
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
    volume_name = kubernetes_persistent_volume.nexus-volume.metadata.0.name
  }
}
