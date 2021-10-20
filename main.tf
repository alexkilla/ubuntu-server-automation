# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable do_token {}

# digital ocean provider
terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.14.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

# Create a new Web Droplet in the nyc2 region
resource "digitalocean_droplet" "web" {
  image  = "ubuntu-20-04-x64"
  name   = "linux-upskill-challenge"
  region = "nyc1"
  size   = "s-1vcpu-1gb"
  ssh_keys = [digitalocean_ssh_key.default.fingerprint]  
  user_data= data.template_file.cloud-init-yaml.rendered
}

resource digitalocean_ssh_key default {
  name       = "Droplet access."
  public_key = file("~/.ssh/id_ed25519.pub")
}

data template_file cloud-init-yaml {
  template = file("${path.module}/files/cloud-init.yaml")
  vars = {
    init_ssh_public_key = digitalocean_ssh_key.default.public_key
  }
}