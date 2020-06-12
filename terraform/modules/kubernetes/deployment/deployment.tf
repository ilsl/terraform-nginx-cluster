resource "kubernetes_deployment" "example" {
  metadata {
    name = var.app_name
    labels = {
      test = var.app_name
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        test = var.app_name
      }
    }

    template {
      metadata {
        labels = {
          test = var.app_name
        }
      }

      spec {
        container {
          image = var.image
          name  = var.app_name
          port {
            container_port = 80
          }
        }
      }
    }
  }
}