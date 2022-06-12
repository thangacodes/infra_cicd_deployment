# CICD-Infra-provision

- Setting up infrastructure provisioning in AWS using Jenkins CICD tool.
- IaC Tool - Terraform
- IDE - VSCode
- Source Code Management - GitHUB
- Notifications - Slack Messages on Job Failure and Success.
- Mainly used Terraform scripts and small bash scripts to invoke the operations.

# Index of the Project Structure

# Dev env tree structure



.
├── apply-Jenkinsfile
├── common_tf.sh
├── Destroy-Jenkinsfile
├── main.tf
├── new-Jenkinsfile
├── outputs.tf
├── providers.tf
├── rds.tf
├── route53.tf
├── script_destroy-Jenkinsfile
├── script.sh
├── ss.sql
├── tfa.sh
├── tfd.sh
└── variables.tf
0 directories, 15 files




# Cert env tree structure
.
├── apply_Jenkinsfile
├── destroy_Jenkinsfile
├── main.tf
├── outputs.tf
├── providers.tf
├── tfa.sh
├── tfd.sh
└── variables.tf

0 directories, 8 files



# Prod env tree structure

.
├── apache_install.yml
├── apache_removal.yml
├── apache.sh
├── apply_Jenkinsfile
├── destroy_Jenkinsfile
├── index.html
├── main.tf
├── outputs.tf
├── providers.tf
├── terraform.tfstate
├── terraform.tfstate.backup
├── tfa.sh
├── tfd.sh
└── variables.tf

0 directories, 14 files
