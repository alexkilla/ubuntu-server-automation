# ubuntu-server-automation

This is a terraform automation to create a droplet in the digital ocean cloud provider.

You need to create your ssh keys in ~/.ssh folder.(ed25519 is recommended by DO)

```
ssh-keygen -t ed25519 -N '' -f ~/.ssh/do_ssh_key <<< y 

terraform init
terraform apply
```

After running the above commands you'll see output like this.
```
Apply complete! Resources: 2 added, 0 changed, 2 destroyed.

Outputs:

ip_address = "161.35.49.56"
```

Connect to the server

```
    ssh -i ~/.ssh/do_ssh alexkilla@161.35.49.56
```



