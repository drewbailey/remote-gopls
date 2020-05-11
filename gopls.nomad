job "gopls" {
  datacenters = ["dc1"]
  type        = "service"

  task "gopls" {
    driver = "docker"
    user   = 1000

    env {
      GOFLAGS = "-tags=consulent -tags=ent"
    }

    config {
      image = "drewbailey/remote-gopls:latest"

      port_map {
        web = 7050
      }
    }

    resources {
      memory = 4200

      network {
        port "web" {
          static = 7050
        }
      }
    }
  }
}
