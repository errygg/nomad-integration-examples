job "app-job" {
  datacenters = ["dc1"]
  type = "service"
  group "app-group" {
    count = 1
    task "app-task" {
      driver = "java"
      config {
        jvm_options = ["-Xmx2048m", "-Xms256m"]
        jar_path = "local/app-0.1.0-SNAPSHOT.jar"
      }
      artifact {
        source = "http://localhost:8000/app-0.1.0-SNAPSHOT.jar"
      }
      vault {
        policies = ["app"]

        change_mode   = "signal"
        change_signal = "SIGUSR1"
      }
      template {
        destination = "config/application-datasource.yml"
        data = <<EOF
{{ with secret "database/creds/db-spring" }}
spring:
  datasource:
    url: jdbc:postgresql://localhost:5432/nomaddemo
    username: {{ .Data.username }}
    password: {{ .Data.password }}
{{ end }}
EOF
      }
    }
  }
}
