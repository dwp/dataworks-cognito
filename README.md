# dataworks-cognito

## Centralised infrastructure for Cognito

This repo mangages the infrastrucutre for AWS Cognito.  It holds the `user pool` known as `concourse` which offers managed authentication for DataWorks services, namely Concourse and Grafana.

The users are managed useing AWS SecretsManager, and can be found [here](https://git.ucd.gpn.gov.uk/dip/dataworks-secrets/tree/master/concourse/dataworks/concourse-cognito).  This is managed within JSON, and passed through a [pipeline](https://ci.dataworks.dwp.gov.uk/teams/dataworks/pipelines/dataworks-cognito?group=user-administration) which checks for various flags being set and carrying out the relevant actions.  See below:

User management:
```
        {
            "username": "myusername",
            "email": "firstname.surname@engineering.digital.dwp.gov.uk",
            "phone": "+441234567890",
            "groups": [
                "dataworks", <-- Grants access to Concourse.  Omit this to remove access.
                "grafana-editor" <-- Grants access to Grafana.  Omit this to remove access.
            ],
            "disabled": "false", <-- Setting this to true, removes the user from the Cognito userpool.
            "reset": "false" <-- Setting this to true, causes Cognito to email the user with a new temporary password.  n.b. This only works if the user has entered the first temporary password, and set their own password.  If not, the user will need to be removed from the user pool and re-added.
        }
```

You cannot remove a user from the JSON without etting them to `"disabled": "true"`, creating a PR, merging and running the pipeline.  All that will do is remove the user from the JSON.  They, and their access, will remain in Cognito.
