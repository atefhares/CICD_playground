resource "kubernetes_namespace" "build-namespace" {
  metadata {
    name = var.build_namespace_name
  }
}

resource "kubernetes_namespace" "dev-namespace" {
  metadata {
    name =  var.dev_namespace_name
  }
}

resource "kubernetes_namespace" "test-namespace" {
  metadata {
    name = var.test_namespace_name
  }
}