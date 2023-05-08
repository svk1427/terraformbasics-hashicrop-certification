# Terraform local-exec Provisioner
local exec antey mana local files tho infra create ipoyaka , ah infra appudaina destroy ipotey ah destroy aiena information like reason,date,time everything will be store into a file in our local files, alagey eadaina data manaki kavaali anukuntey ah data ni kuda e local exec use cheskoni oka file loki fetc cheskovachu , fetch chesaka dhanni local lo save avuthai
## Step-00: Pre-requisites
- Create a EC2 Key pain with name `terraform-key` and copy the `terraform-key.pem` file in the folder `private-key` in `terraform-manifest` folder
- Connection Block for provisioners uses this to connect to newly created EC2 instance to copy files using `file provisioner`, execute scripts using `remote-exec provisioner`

## Step-01: Introduction
- Understand about **local-exec** Provisioner
- The `local-exec` provisioner invokes a local executable after a resource is created. 
- This invokes a process on the machine running Terraform, not on the resource. 

## Step-02: Review local-exec provisioner code
- We will create one provisioner during creation-time. It will output private ip of the instance in to a file named `creation-time-private-ip.txt`
- We will create one more provisioner during destroy time. It will output destroy time with date in to a file named `destroy-time.txt`
- **C3-ec2-instance.tf**
```t
  # local-exec provisioner (Creation-Time Provisioner - Triggered during Create Resource)
  provisioner "local-exec" {
    command = "echo ${aws_instance.my-ec2-vm.private_ip} >> creation-time-private-ip.txt"
    working_dir = "local-exec-output-files/"
    #on_failure = continue
  }

  # local-exec provisioner - (Destroy-Time Provisioner - Triggered during Destroy Resource)
  provisioner "local-exec" {
    when    = destroy
    command = "echo Destroy-time provisioner Instanace Destroyed at `date` >> destroy-time.txt"
    working_dir = "local-exec-output-files/"
  }  
```


## Step-03: Review Terraform manifests & Execute Terraform Commands
```t
# Terraform Initialize
terraform init

# Terraform Validate
terraform validate

# Terraform Format
terraform fmt

# Terraform Plan
terraform plan

# Terraform Apply
terraform apply -auto-approve

# Verify
Verify the file in folder "local-exe-output-files/creation-time-private-ip.txt"

```
## Step-04: Clean-Up Resources & local working directory
```t
# Terraform Destroy
terraform destroy -auto-approve

# Verify
Verify the file in folder "local-exe-output-files/destroy-time.txt"

# Delete Terraform files 
rm -rf .terraform*
rm -rf terraform.tfstate*
```

