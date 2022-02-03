variable "instance_name" { 
  description = "The name of the droplet"
  type = string
  default = "vps-1"
}

variable "region" { 
  description = "The region the droplet is in"
  type = string
  default = "fra1"
}

variable "image" { 
  description = "The distro image to use"
  type = string
  default = "debian-11-x64"
}

variable "plan" { 
  description = "The droplet size"
  type = string
  default = "s-1vcpu-1gb"
}

variable "ansible_repo" {
  description = "URL to the repository of the ansible playbook"
}

variable "do_token" {
  description = "Your digitalocean API token"
  sensitive = true
}

variable "do_key_name" {
  description = "The name you gave your public SSH key when you imported it into digitalocean"
  default = "terraform"
}

variable "pvt_key" {
  description = "The path to the private key used to login for provisioning"
  type = string
  default = "$HOME/.ssh/id_rsa"
}

variable "pub_key" {
  description = "The public key which is added to the user’s authorized_keys file as string"
  type = string
}

variable "username" {
  description = "The name of the user we create"
  type = string
}

variable "password" {
  description = "The password of the user we create"
  type = string
  sensitive = true
}
