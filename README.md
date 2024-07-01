# Getting Started
This project provides instructions to get started with Terraform using Chocolatey Follow the steps below to install the required tools and utilize Terraform for managing your infrastructure.

## Prerequisites
- Windows operating system
- PowerShell

## Chocolatey Installation

Chocolatey is a package manager for Windows. To install Chocolatey, follow these steps:

1. Open PowerShell as an Administrator.
2. Run the following command to install Chocolatey:

    ```powershell
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    ```

3. Verify the installation by checking the version of Chocolatey:

    ```powershell
    choco --version
    ```

## Install Terraform using Chocolatey

1. Install Terraform with Chocolatey by running:

    ```powershell
    choco install terraform
    ```

2. Confirm the installation by checking the Terraform version:

    ```powershell
    terraform --version
    ```

## Terraform Commands

Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. Below are the basic commands to get started with Terraform:

- `terraform init`: Prepares the working directory for other commands.
- `terraform validate`: Validates the configuration files.
- `terraform plan`: Shows changes required by the current configuration.
- `terraform apply`: Applies the planned changes to reach the desired state.
- `terraform destroy`: Destroys the infrastructure managed by Terraform.
- `terraform workspace show`: Displays the current workspace.
- `terraform workspace list`: Lists all available workspaces.
- `terraform workspace new [workspace_name]`: Creates a new workspace.
- `terraform workspace select [workspace_name]`: Selects an existing workspace.

  
## Terraform State

Terraform uses state files to map real-world resources to your configuration, keep track of metadata, and improve performance for large infrastructures. By default, the state is stored in a local file named `terraform.tfstate`.

State files are in JSON format and contain the following information:
- Mapped resources to configuration
- Metadata tracking
- Performance improvements

## Resource Block Example

A resource block in Terraform defines the objects that Terraform manages. Below is an example of a resource block for an Azure resource:

```hcl
resource "azurerm_resource" "example" {
    name     = "learn-lf-example"
    location = "eastus"
}
```

## Resource Providers

Terraform providers are plugins that Terraform uses to manage resources. You can find the Azure provider and its documentation at:
[Terraform Azure Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest)

# Conclusion
Happy Infrastructure as Code!
