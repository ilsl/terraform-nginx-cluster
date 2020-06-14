resource "kubernetes_service" "nodeport" {
  metadata {
    name = "${var.app_name}-nodeport"
  }
  spec {
    selector = {
      test = "${kubernetes_deployment.example.metadata.0.labels.test}"
    }
    port {
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}

resource "kubernetes_ingress" "example_ingress" {
  metadata {
    name = "${var.app_name}-ingress"
  }

  spec {
    backend {
      service_name = "${var.app_name}-nodeport"
      service_port = 80
    }
  }

  depends_on = [kubernetes_service.nodeport]

}