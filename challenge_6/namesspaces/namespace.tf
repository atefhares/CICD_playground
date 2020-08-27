resource "kubernetes_namespace" "build-namespace" {
  metadata {
    name = "build"
  }
}

resource "kubernetes_namespace" "dev-namespace" {
  metadata {
    name = "dev"
  }
}

resource "kubernetes_namespace" "test-namespace" {
  metadata {
    name = "test"
  }
}