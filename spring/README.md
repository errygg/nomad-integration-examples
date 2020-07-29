# spring

This is an example of running a Spring Boot application on Nomad. Additionally, this example includes an integration with HashiCorp Vault to consume a dynamic database credential for PostGreSQL.

The entire demo can be done by running `scripts/start.sh`.

To run each component separately:

1. Start Postgres: `postgres/start-postgres.sh`
2. Configure Postgres: `postgres/configure-postgres.sh`
3. Start Vault: `vault/start-vault.sh`
4. Configure Vault: `vault/configure-vault.sh`
5. Start Nomad: `nomad/start-nomad.sh`
6. Build the app: `cd app; mvn clean install spring-boot:repackage`
7. Start the artifact server: `cd target; python -m SimpleHTTPServer 8000 > /tmp/http.log 2>&1 &`
8. Run the Nomad job: `cd ../../jobs; nomad job run app.hcl`

Check that the job is running:

```shell
$ nomad job status app-job                                                                                                                                                                 (master)nomad-integration-examples
ID            = app-job
Name          = app-job
Submit Date   = 2020-07-28T18:21:34-06:00
Type          = service
Priority      = 50
Datacenters   = dc1
Namespace     = default
Status        = running
Periodic      = false
Parameterized = false

Summary
Task Group  Queued  Starting  Running  Failed  Complete  Lost
app-group   0       0         1        0       0         0

Latest Deployment
ID          = 84c022bb
Status      = successful
Description = Deployment completed successfully

Deployed
Task Group  Desired  Placed  Healthy  Unhealthy  Progress Deadline
app-group   1        1       1        0          2020-07-28T18:31:45-06:00

Allocations
ID        Node ID   Task Group  Version  Desired  Status   Created     Modified
5256ff7e  3d8db652  app-group   0        run      running  21m22s ago  21m11s ago
```

and check that the `Thing` objects got put in the database:

```shell
$ nomad alloc logs 5256ff7e
...
2020-07-28 18:21:44.355  INFO 34966 --- [           main] com.hashicorp.app.Application            : Started Application in 7.638 seconds (JVM running for 8.433)
com.hashicorp.app.Thing@5d152bcd
com.hashicorp.app.Thing@6435fa1c
2020-07-28 18:22:07.512  INFO 34966 --- [nio-8080-exec-1] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring DispatcherServlet 'dispatcherServlet'
...
```
