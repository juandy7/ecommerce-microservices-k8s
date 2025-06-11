provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "dev" {
  metadata {
    name = "dev"
  }
}

resource "kubernetes_namespace" "qa" {
  metadata {
    name = "qa"
  }
}

resource "kubernetes_namespace" "prod" {
  metadata {
    name = "prod"
  }
}

// Ejemplo de deployment para api-gateway en dev
resource "kubernetes_deployment" "api_gateway_dev" {
  metadata {
    name      = "api-gateway"
    namespace = kubernetes_namespace.dev.metadata[0].name
    labels = {
      app = "api-gateway"
    }
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "api-gateway"
      }
    }
    template {
      metadata {
        labels = {
          app = "api-gateway"
        }
      }
      spec {
        container {
          name  = "api-gateway"
          image = "tu-repo/api-gateway:latest"
          port {
            container_port = 8080
          }
        }
      }
    }
  }
}

// Ejemplo de service para api-gateway en dev
resource "kubernetes_service" "api_gateway_dev" {
  metadata {
    name      = "api-gateway"
    namespace = kubernetes_namespace.dev.metadata[0].name
  }
  spec {
    selector = {
      app = "api-gateway"
    }
    port {
      port        = 80
      target_port = 8080
    }
    type = "ClusterIP"
  }
}