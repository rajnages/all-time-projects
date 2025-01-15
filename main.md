# packer:
packer is a tool provided by hashicorp it helps us to create machine images using single source configuration file. it automates the process, ensures consistency, and saves time by enabling the same configuration file multiple environments like aws,docker,gcp,vmware

# terraform:
terraform is a tool provided by hashicorp it helps us to provision and manage infrastructure as code. it allows to create,modify,delete
infrastructure resources like network,storage, vms in a consistent and automated way.

# why we used:
- automate infrastructure
- multicloud platform
- scales and modifications
- easy to collabrate


# terraform init:
   This command sets up the working environment for Terraform. It prepares your local system to use the provider
   (like AWS), installs necessary plugins, and gets everything ready for actual resource management.
# terraform plan:
   Terraform compares your current configuration (the code you wrote) with the current state
   (what's already deployed on AWS) and generates a plan of action.
# terraform apply:
   When you’re ready to make changes to AWS based on the plan, you run terraform apply.
   This is when Terraform will actually interact with the AWS API and create/update the resources
   as per your configuration.

# terrafrom import:
  - data resources:
    Data resources are used to retrieve information about existing infrastructure that is already managed by Terraform or another system
  - terraform import:
    Import allows you to bring existing infrastructure under Terraform’s control, so it can be managed and updated by Terraform moving forward.
# terraform taint and untaint:
  - Terraform taint is a command used to mark a resource as 'tainted,' meaning Terraform will destroy and recreate that resource during the next terraform apply. This is useful when you want to force a resource to be replaced, even if no changes are made to the configuration. For example, if a resource is in a broken or unhealthy state, tainting it ensures it's recreated.
  - On the other hand, terraform untaint is used to remove the 'taint' from a resource. If you mistakenly mark a resource as tainted, or if you change your mind about wanting to replace it, you can use terraform untaint

# vault:
- Vault is a tool developed by HashiCorp that is primarily used for securing sensitive data such as secrets, tokens, passwords, API keys, and encryption keys
     

 