resource "digitalocean_droplet" "vps-1" {
  image = var.image
  name = var.instance_name
  region = var.region
  size = var.plan
  ssh_keys = [
    data.digitalocean_ssh_key.terraform.id
  ]
  
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }
  
  provisioner "remote-exec" {
    inline = [
      " export ANSIBLE_USER=${var.username}",
      " export ANSIBLE_USERPASS=${var.password}",
      " export ANSIBLE_PUBKEY=${var.pub_key}",
      "apt update",
      "apt install -y git ansible",
      "ansible-pull -U ${var.ansible_repo}",
      " export ANSIBLE_USERPASS=''",
      "echo '' > ~/.bash_history"
    ]
  }
}

output "ip_address" {
  value = digitalocean_droplet.vps-1.ipv4_address
}

output "plan" {
  value = digitalocean_droplet.vps-1.size
}

output "price_monthly" {
  value = digitalocean_droplet.vps-1.price_monthly
}

output "username" {
  value = var.username
}
