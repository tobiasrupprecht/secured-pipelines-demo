# secured-pipelines-demo
Clone the repo:
```
git clone 
cd secured-pipelines-demo/
```

Execute the following command to setup up everything:
```
bash 00_check_prerequisites.sh

bash 01_setup_vault.sh tf
```

Setup other components:
```
bash 02_setup_gitlab.com.sh tf

bash 03_setup_tfc.sh tf
```

For AWS:
```
AWS_SECRET_ACCESS_KEY=YOUR_KEY AWS_ACCESS_KEY_ID=YOUR_KEY_ID bash 04a_configure_aws_secrets.sh tf
```

For Azure:
```
bash 04b_configure_azure_secrets.sh tf
```

For GCP:
```
bash 04c_configure_gcp_secrets.sh tf
```

Configure TFC Engine and JWT Auth:
```
bash 05_configure_vault_tfc_secrets.sh tf

bash 06_configure_vault_gitlab_jwt_auth.sh tf
```

Deploy multiple example projects:
```
action = on(boarding) or off(boarding)
cloud = aws or azure
bash 08_onboarding_projects.sh action cloud project_name
```

Cleanup onboarding example projects:
```
action = on(boarding) or off(boarding)
cloud = aws or azure
bash 08_onboarding_projects.sh action cloud project_name
```

Build and upload Docker image for Gitlab pipelines:
```
bash 30_build_and_publish_docker_image.sh
```
