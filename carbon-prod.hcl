job "carbon-prod" {

  datacenters = ["fin-yx"]

  type = "service"

  group "carbon-prod-main" {

    count = 1

    task "carbon-prod-task" {
      driver = "docker"

      config {
        image = "registry.gitlab.com/love4src/carbon:[[.commit_sha]]"
        auth {
          username = "gitlab+deploy-token-674866"
          password = "5s5mzsimmP9XC9AHDreo"
        }
        volumes = [
          "local/default.conf:/etc/nginx/conf.d/default.conf",
        ]
      }

      env {
        NGINX_PORT="${NOMAD_PORT_http}"
      }

      template {
        data = <<EOF
server {
    listen {{ env "NOMAD_PORT_http" }};

    add_header X-Frame-Options SAMEORIGIN;
    add_header X-Content-Type-Options nosniff;
    add_header X-XSS-Protection "1; mode=block";
    add_header Content-Security-Policy "default-src 'self';connect-src 'self' https://love4src.com;script-src 'self' 'unsafe-inline' 'unsafe-eval' https://unpkg.com;style-src 'self' 'unsafe-inline';img-src 'self' blob: https://beta.love4src.com data: https://love4src.com https://i.imgur.com https://images.bitclout.com https://images.deso.org https://gfx.love4src.com https://arweave.net https://*.arweave.net https://cloudflare-ipfs.com https://quickchart.io; font-src 'self'; frame-src 'self'; frame-ancestors 'self';";
    location /health {
      add_header Content-Type text/plain;
      return 200 'ok';
    }
    location /assets/images/ {
        root   /usr/share/nginx/html/assets;
        try_files $uri =404;
    }
    location / {
        root   /usr/share/nginx/html;
        index index.html;
    }
}
EOF
        destination = "local/default.conf"
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
          sha = "[[.commit_sha]]"
        }

        check {
          name     = "Carbon Frontend HTTP"
          type     = "http"
          path     = "/health"
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
          port "http" {}
        }
      }
    }
  }
}
