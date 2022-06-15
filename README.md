# database-migration
Continuous Database Configuration with Flyway and Kubernetes

This repo is inspired by the following blog posting

* https://reflectoring.io/flyway-kubernetes-continuous-database-configuration/

# Usage

To run a migration 

    helm install migrate1 chart

You can then review the migration logs as follows

    kubectl logs -l job-name=migrate1

# Configuration

Chart has the following structure

    chart
    ├── Chart.yaml
    ├── migrations
    │   ├── V1_1__create_user.sql
    │   ├── V1_2__create_db.sql
    │   ├── V1_3__grant_privileges.sql
    │   └── V1_4__create_demo_table.sql
    ├── templates
    │   ├── _helpers.tpl
    │   ├── app-configmap.yaml
    │   ├── app-secret.yaml
    │   ├── migration-configmap.yaml
    │   └── migration-job.yaml
    └── values.yaml

Flyway migrations are stored under the "migrations" subdirectory and pulled into the temple "migration-configmap.yaml"

