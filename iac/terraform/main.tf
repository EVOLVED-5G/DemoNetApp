resource "kubernetes_pod" "DemoNetApp" {
  metadata {
    name = "DemoNetApp"
    namespace = "evolved5g"
    labels = {
      app = "DemoNetApp"
    }
  }

  spec {
    container {
      image = "dockerhub.hi.inet/evolved-5g/dummy-netapp:latest"
      name  = "dummy-netapp"
    }
  }
}

resource "kubernetes_service" "DemoNetApp_service" {
  metadata {
    name = "DemoNetApp"
    namespace = "evolved5g"
  }
  spec {
    selector = {
      app = kubernetes_pod.DemoNetApp.metadata.0.labels.app
    }
    port {
      port = 80
      target_port = 80
    }
  }
}
