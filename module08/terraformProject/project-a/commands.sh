# List resources containing a specific string in the name
az resource list --query "[?contains(name, 'sa')]" --output table

# List resources of a specific type
az resource list --resource-type "Microsoft.Storage/storageAccounts" --output table

# Get the id of a specific resource
az resource show --resource-group uo-rg-demo-project-a --name uosademo12364s --resource-type "Microsoft.Storage/storageAccounts" --query id --output tsv

# Creates a json file with the list of resources
az resource list --resource-group uo-rg-demo-project-a --output json > resources.json

# list all resources in state:
terraform state list 

# Remove a resource from terraform state
terraform state rm module.storage.azurerm_storage_account.sa-demo 

# Move a resource to another resource group
az resource move --destination-group uo-rg-demo-project-b \
  --ids /subscriptions/30ee9279-e76e-409d-8973-00c9792f6bcb/resourceGroups/uo-rg-demo-project-a/providers/Microsoft.Storage/storageAccounts/uosademo12364s