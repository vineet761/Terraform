This module is for Eventhub creation consisting of below componenets:

1. Eventhub Namespace
2. Eventhub
3. Consumer Group



Pre-requisite to make this module work :
1. Create a service principal.
2. Extract all the values using the following link :https://www.terraform.io/docs/providers/azurerm/auth/service_principal_client_certificate.html
   and update the below values as per your environment 

provider "azurerm"{
  version         = "~> 1.27"
  subscription_id = ""
  client_id       = ""
  client_secret   = ""
  tenant_id       = ""
  
}


3. Install Azure cli in your system -> https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest
4. Install Terraform in your system ->https://learn.hashicorp.com/terraform/getting-started/install.html
5. Run the code and Enjoyy !!!!!!
