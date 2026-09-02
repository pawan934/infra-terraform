# ☁️ Azure Infrastructure with Terraform (`infra-terraform`)

✨ A modular Infrastructure as Code (IaC) repository built using **Terraform** 🛠️ to provision and manage scalable **Microsoft Azure** 🌐 resources.

---

## 📌 Repository Overview

This repository leverages reusable Terraform modules driven by dynamic `for_each` maps to provision core Azure infrastructure across different environments seamlessly.

### 🔑 Key Components Provisioned
- 📦 **Resource Groups**: Logical containers for Azure resources.
- 🌐 **Virtual Networks (VNet)**: Isolated virtual network infrastructure.
- 🔀 **Subnets**: Segmented subnetworks within Virtual Networks (e.g., frontend, backend).
- 🌍 **Public IP Addresses (PIP)**: Static/Dynamic public IPs for external accessibility.
- 💻 **Compute**: Azure Windows Virtual Machines configured with dedicated Network Interface Cards (NICs).

---

## 📁 Repository Structure

```text
infra-terraform/
├── ⚙️ envoirment/             # Environment-specific deployment configurations
│   └── 🧪 pre_pod/            # Pre-production environment configuration
│       ├── 📄 main.tf         # Module instantiation & dependency management
│       ├── 📄 provider.tf     # HashiCorp AzureRM provider configuration (=5.0.0)
│       ├── 📄 variables.tf    # Input variable declarations
│       ├── 📄 terraform.tfvars# Environment-specific configuration data
│       └── 🛡️ security_test.txt# Security scanning test file (tfsec)
├── 🧩 modules/                # Reusable Terraform modules
│   ├── 💻 compute/            # Windows VMs & NIC resources
│   ├── 🌍 pip/                # Azure Public IP resources
│   ├── 📦 resource_group/     # Azure Resource Group resources
│   ├── 🔀 subnet/             # Azure Subnet resources
│   └── 🌐 virtual_network/    # Azure Virtual Network resources
└── 📜 README.md               # Project documentation
```

---

## 🛠️ Terraform Modules

Each module in the `modules/` directory uses `for_each` loops to allow dynamic provisioning based on map variables passed from environment configurations:

| Module 🧩 | Location 📂 | Description 📝 |
| :--- | :--- | :--- |
| **Resource Group** 📦 | [`modules/resource_group`](file:///d:/Practice/infra-github/infra-terraform/modules/resource_group) | Manages `azurerm_resource_group` creation. |
| **Virtual Network** 🌐| [`modules/virtual_network`](file:///d:/Practice/infra-github/infra-terraform/modules/virtual_network) | Manages `azurerm_virtual_network` address spaces. |
| **Subnet** 🔀         | [`modules/subnet`](file:///d:/Practice/infra-github/infra-terraform/modules/subnet) | Configures subnets bound to Virtual Networks. |
| **Public IP** 🌍      | [`modules/pip`](file:///d:/Practice/infra-github/infra-terraform/modules/pip) | Configures static/dynamic public IP addresses. |
| **Compute** 💻        | [`modules/compute`](file:///d:/Practice/infra-github/infra-terraform/modules/compute) | Configures Windows VMs (`azurerm_windows_virtual_machine`) and NICs (`azurerm_network_interface`). |

---

## 🚀 Getting Started & Deployment Guide

### 📋 Prerequisites
- 🔹 **Terraform CLI**: `v1.0+` installed on your machine.
- 🔹 **Azure CLI**: Logged in and configured with appropriate permissions.
  ```bash
  az login
  az account set --subscription "<YOUR_SUBSCRIPTION_ID>"
  ```

### ⚙️ Deployment Steps

1. 📂 **Navigate to the target environment directory**:
   ```bash
   cd envoirment/pre_pod
   ```

2. 🏁 **Initialize Terraform**:
   Downloads the `hashicorp/azurerm` provider plugin and sets up backend state:
   ```bash
   terraform init
   ```

3. ✅ **Validate Configuration**:
   Ensure the syntax and module configurations are valid:
   ```bash
   terraform validate
   ```

4. 🔍 **Generate Execution Plan**:
   Inspect proposed infrastructure changes before applying:
   ```bash
   terraform plan
   ```

5. 🚀 **Apply Infrastructure Changes**:
   Deploy infrastructure to Azure:
   ```bash
   terraform apply
   ```

---

## 🔒 Security & Best Practices

- 🛡️ **Security Scanning**: This repository includes sample test cases (`security_test.txt`) designed for static security analysis tools such as [`tfsec`](https://github.com/aquasecurity/tfsec) or `checkov`.
- 🔑 **Secrets Management**: Admin passwords and credentials should be stored securely in **Azure Key Vault** or passed as secure variables/environment variables rather than committed directly into `.tfvars` files in production deployments.