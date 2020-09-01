resource "kubernetes_persistent_volume" "mysql-volume-dev" {
  depends_on = [
    kubernetes_namespace.build-namespace,
  ]

  metadata {
    name = "mysql-volume-dev"
  }
  spec {
    capacity = {
      storage = "2Gi"
    }
    access_modes = ["ReadWriteMany"]
    persistent_volume_source {
      host_path {
        path = "/mysql-data-dev"
      }
    }
    storage_class_name = "standard"
  }
}


resource "kubernetes_persistent_volume_claim" "mysql-volume-claim-dev" {
  metadata {
    name      = "mysql-volume-claim-dev"
    namespace = var.dev_namespace_name
  }
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
    volume_name = kubernetes_persistent_volume.mysql-volume-dev.metadata.0.name
  }
}