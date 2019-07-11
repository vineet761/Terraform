This module is for Eventhub creation consisting of below componenets:

1. Eventhub Namespace
2. Eventhub
3. Consumer Group

4. Dynamic Capture Description : A capture_description block as defined below.
   -----A capture_description block supports the following:

        enabled - (Required) Specifies if the Capture Description is Enabled.

        encoding - (Required) Specifies the Encoding used for the Capture Description. Possible values are Avro and AvroDeflate.

        interval_in_seconds - (Optional) Specifies the time interval in seconds at which the capture will happen. Values can be between 60 and 900 seconds. Defaults to 300 seconds.

        size_limit_in_bytes - (Optional) Specifies the amount of data built up in your EventHub before a Capture Operation occurs. Value should be between 10485760 and 524288000 bytes. Defaults to 314572800 bytes.

        skip_empty_archives - (Optional) Specifies if empty files should not be emitted if no events occur during the Capture time window. Defaults to false.

        destination - (Required) A destination block as defined below.

                 
                                    A destination block supports the following:

                    name - (Required) The Name of the Destination where the capture should take place. At this time the only supported value is EventHubArchive.AzureBlockBlob.
                    At this time it's only possible to Capture EventHub messages to Blob Storage. There's a Feature Request for the Azure SDK to add support for Capturing messages to Azure Data Lake here.

                    archive_name_format - The Blob naming convention for archiving. e.g. {Namespace}/{EventHub}/{PartitionId}/{Year}/{Month}/{Day}/{Hour}/{Minute}/{Second}. Here all the parameters (Namespace,EventHub .. etc) are mandatory irrespective of order

                    blob_container_name - (Required) The name of the Container within the Blob Storage Account where messages should be archived.

                    storage_account_id - (Required) The ID of the Blob Storage Account where messages should be archived.




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
