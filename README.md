# Terraform Web Server Deployment

This project uses Terraform to deploy a simple **web server (Apache or Nginx)** on an **AWS EC2 instance**. The infrastructure is defined using Terraform, and it includes a security group, an EC2 instance, and outputs for the instance's public IP address.

---

## **Table of Contents**
- [Prerequisites](#prerequisites)
- [Project Structure](#project-structure)
- [Setup Instructions](#setup-instructions)
- [Usage](#usage)
- [Outputs](#outputs)
- [Destroying Resources](#destroying-resources)

---

## **Prerequisites**

Before using this Terraform configuration, ensure that you have the following:

1. **AWS Account**: You need to have an active AWS account with necessary IAM permissions.
2. **Terraform**: Terraform installed on your local machine. You can download it from [Terraform Downloads](https://www.terraform.io/downloads.html).
3. **AWS CLI**: AWS CLI configured with your credentials. You can configure it by running:
    ```bash
    aws configure
    ```
4. **SSH Key Pair**: You need to have an SSH key pair in AWS for connecting to the EC2 instance.

---

## **Project Structure**

The project structure is organized as follows:

```
terraform-web-server/
│
├── main.tf               # Main Terraform configuration file
├── variables.tf          # Variable definitions for the project
|-- backend.tf            # Remort state managment
├── outputs.tf            # Output values from Terraform
├── modules/
│   └── ec2-instance/     # EC2 instance module for creating the server
│       ├── main.tf       # EC2 instance creation logic
│       ├── variables.tf  # Variables for the EC2 instance
│       └── outputs.tf    # Outputs for the EC2 instance module
├── terraform.tfvars      # Your environment-specific values (e.g., AWS region)
└── README.md             # This README file
```

---

## **Setup Instructions**

### **1. Clone the repository:**
Clone this repository to your local machine:
```bash
git clone <your-repository-url>
cd terraform-web-server
```

### **2. Configure your AWS Credentials:**
If you haven't done so already, configure your AWS CLI with the required IAM permissions:
```bash
aws configure
```

### **3. Update Variables:**
Edit the `terraform.tfvars` file to set the values for your environment-specific configurations. At a minimum, you should define:
```hcl
aws_region = "us-east-1"    # AWS Region
instance_type = "t2.micro"  # EC2 Instance Type
ami_id = "ami-xxxxxxxx"     # AMI ID for your EC2 instance
key_name = "your-key-name"  # SSH Key Pair name
```

---

## **Usage**

### **1. Initialize Terraform:**
Before using Terraform, initialize the working directory:
```bash
terraform init
```

### **2. Apply the Configuration:**
Once Terraform is initialized, apply the configuration to create the resources:
```bash
terraform apply
```

Terraform will display the changes it plans to make. Type `yes` to approve the changes.

### **3. View the Public IP of the EC2 Instance:**
Once the infrastructure is deployed, you can view the public IP of the EC2 instance with the following command:
```bash
terraform output public_ip
```

This will display the public IP of the instance that you can use to connect via SSH.

---

## **Outputs**

After running `terraform apply`, the following output will be shown:

- **public_ip**: The public IP address of the deployed EC2 instance.

Example output:
```bash
Outputs:

public_ip = "54.201.10.121"
```

This IP can be used to SSH into the EC2 instance if your key pair is correctly configured.

---

## **Destroying Resources**

To destroy the infrastructure (delete the EC2 instance, security group, etc.), run:
```bash
terraform destroy
```
Terraform will ask for confirmation before deleting the resources. Type `yes` to confirm.

---

## **Notes**
- Ensure you have an SSH key pair available in your AWS region. If you don't have one, you can create it from the AWS Console or using AWS CLI.
- The `key_name` should match the name of the SSH key pair you've created or are planning to use.
- The AMI ID (`ami_id`) should be updated to match the desired operating system image you want to use. You can find the AMI ID in the AWS console or use an Amazon Linux AMI.

---

## **Troubleshooting**

- If you're not seeing the output after `terraform apply`, try running `terraform output` or `terraform refresh`.
- Ensure that the EC2 instance has a public IP by setting `associate_public_ip_address = true` if it's missing.

---

## **License**
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

