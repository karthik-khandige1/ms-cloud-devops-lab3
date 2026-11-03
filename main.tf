terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.35"
    }
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "kind-lab2"
}

variable "image_version" {
  description = "Hello application version"
  type        = string
  default     = "v2"
}

resource "kubernetes_deployment" "hello_app" {
  metadata {
    name      = "hello-app"
    namespace = "lab3"

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
    namespace = "lab3"
  }

  spec {
    selector = {
      app = "hello-app"
    }

    port {
      port        = 8080
      target_port = 80
    }

    type = "ClusterIP"
  }
}
