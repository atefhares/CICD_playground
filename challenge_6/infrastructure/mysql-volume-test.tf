resource "kubernetes_persistent_volume" "mysql-volume-test" {
  depends_on = [
    kubernetes_namespace.build-namespace,
  ]

  metadata {
    name = "mysql-volume-test"
  }
  spec {
    capacity = {
      storage = "2Gi"
    }
    access_modes = ["ReadWriteMany"]
    persistent_volume_source {
      host_path {
        path = "/mysql-data-test"
      }
    }
    storage_class_name = "standard"
  }
}


resource "kubernetes_persistent_volume_claim" "mysql-volume-claim-test" {
  metadata {
    name      = "mysql-volume-claim-test"
    namespace = var.test_namespace_name
  }
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
    volume_name = kubernetes_persistent_volume.mysql-volume-test.metadata.0.name
  }
}