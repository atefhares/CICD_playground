resource "kubernetes_persistent_volume" "mysql-volume" {
  depends_on = [
    kubernetes_namespace.build-namespace,
  ]

  metadata {
    name = "mysql-volume"
  }
  spec {
    capacity = {
      storage = "2Gi"
    }
    access_modes = ["ReadWriteMany"]
    persistent_volume_source {
      host_path {
        path = "/mysql-data"
      }
    }
    storage_class_name = "standard"
  }
}


resource "kubernetes_persistent_volume_claim" "mysql-volume-claim-namespace-dev" {
  metadata {
    name      = "mysql-volume-claim"
    namespace = var.dev_namespace_name
  }
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
    volume_name = kubernetes_persistent_volume.mysql-volume.metadata.0.name
  }
}

resource "kubernetes_persistent_volume_claim" "mysql-volume-claim-namespace-test" {
  metadata {
    name      = "mysql-volume-claim"
    namespace = var.test_namespace_name
  }
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
    volume_name = kubernetes_persistent_volume.mysql-volume.metadata.0.name
  }
}