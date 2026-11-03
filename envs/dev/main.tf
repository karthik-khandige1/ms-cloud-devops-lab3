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

module "hello" {
  source        = "../../modules/hello-app"
  namespace     = "dev"
  port          = 8080
  image_version = "v2"
}
