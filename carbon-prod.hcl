job "carbon-prod" {

  datacenters = ["fin-yx"]

  type = "service"

  group "carbon-prod-main" {

    count = 2

    task "carbon-prod-task" {
      driver = "docker"

      config {
        image = "registry.gitlab.com/love4src/carbon:[[.commit_sha]]"
        auth {
          username = "gitlab+deploy-token-674866"
          password = "5s5mzsimmP9XC9AHDreo"
        }
      }

      service {
        name = "carbon-prod"
        port = "http"

        tags = [
          "internal-proxy.enable=true",
          "internal-proxy.http.routers.carbon-prod.rule=Host(`beta.love4src.com`)",
          "internal-proxy.http.routers.carbon-prod.entrypoints=https"
        ]

        meta {
          amp = "${NOMAD_PORT_management}"
          sha = "[[.commit_sha]]"
          prom = "${NOMAD_PORT_prometheus}"
        }

        check {
          name     = "Carbon Frontend HTTP"
          type     = "http"
          path     = "/"
          interval = "15s"
          timeout  = "30s"
          check_restart {
            limit = 3
            grace = "30s"
            ignore_warnings = false
          }
        }
      }

      resources {
        cpu = 32
        memory = 32
        network {
          mbits = 10
          port "http" {
            to = 80
          }
        }
      }
    }
  }
}
