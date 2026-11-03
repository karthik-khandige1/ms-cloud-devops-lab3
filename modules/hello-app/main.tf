variable "namespace" {
  type = string
}

variable "port" {
  type = number
}

variable "image_version" {
  type    = string
  default = "v2"
}

resource "kubernetes_namespace" "app" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_deployment" "hello_app" {
  metadata {
    name      = "hello-app"
    namespace = kubernetes_namespace.app.metadata[0].name

    labels = {
      app = "hello-app"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "hello-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "hello-app"
        }
      }

      spec {
        container {
          name  = "hello-app"
          image = "shripada/hello-app:${var.image_version}"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "hello_service" {
  metadata {
    name      = "hello-app"
    namespace = kubernetes_namespace.app.metadata[0].name
  }

  spec {
    selector = {
      app = "hello-app"
    }

    port {
      port        = var.port
      target_port = 80
    }

    type = "ClusterIP"
  }
}
