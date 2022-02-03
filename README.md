# terraform-ansible
Deploy a VPS on digitalocean with terraform and provision it with ansible-pull.

## Usage
This includes only the terraform files which execute an ansible playbook of your choice on the new VPS. Provide the required variables as described below or via environment variables and run with `terraform init`, `terraform plan`, and `terraform apply` as usual.

### Variables
Since I use this with my [ctf-vps ansible playbook](https://github.com/iougiri/ctf-vps) that creates a sudo user, `username`, `password`, and `pub_key`  variables are used. If you use another ansible playbook that doesn’t create a user account, feel free to fill those with dummy values. 

All variables without a default value must be provided by the user. I put the variables that do not contain sensitive values in `terraform.tfvars` and the sensitive ones in `secret.auto.tfvars` which is in .gitignore. Both files are loaded automatically and do not have to be provided as command-line arguments.

**Important:** The value has to be quoted twice like this: `pub_key = "'ssh-ed25519 AAAAZ5MaaeXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXrAPrd3puF2vfpX user@host'"`

|Variable|Default Value|Sensitive|Description|
|---|---|---|---|
|do_token||yes|Your digitalocean API token|
|username||yes|username for the account that is created|
|password||yes|password of the account that is created|
|ansible_repo||no|URL to the ansible playbook repo (needs local.yml)|
|pub_key||no|The public SSH key that is added to authorized_keys of account that is created|
|pvt_key|$HOME/.ssh/id_rsa|yes|The private SSH key that terraform uses to install and start ansible on the server|
|do_key_name|terraform|no|The name you gave your public SSH key an digitalocean|
|instance_name|vps-1|no|The name you want to give the VPS instance|
|region|fra1|no|The region the VPS will be in|
|image|debian-11-x64|no|The distro image to use|
|plan|s-1vcpu-1gb|no|The droplet size to use|


