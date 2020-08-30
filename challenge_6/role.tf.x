resource "kubernetes_role" "modify-pods-role" {
  metadata {
    name = "modify-pods"
    labels = {
      test = "MyRole"
    }
  }

  rule {
    api_groups     = [""]
    resources      = ["pods"]
    resource_names = ["foo"]
    verbs          = ["get", "list", "watch", "delete", "create", "update", "patch"]
  }
}