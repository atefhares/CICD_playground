resource "kubernetes_namespace" "build-namesapce" {
  metadata {
    name = "build"
  }
}

resource "kubernetes_namespace" "dev-namesapce" {
  metadata {
    name = "dev"
  }
}

resource "kubernetes_namespace" "test-namesapce" {
  metadata {
    name = "test"
  }
}