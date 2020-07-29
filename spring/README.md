# spring

This is an example of running a Spring Boot application on Nomad. Additionally, this example includes an integration with HashiCorp Vault to consume a dynamic database credential for PostGreSQL.

1. Start Postgres: `postgres/start-postgres.sh`
1. Configure Postgres: `postgres/configure-postgres.sh`
1. Start Vault
1. Start Nomad
