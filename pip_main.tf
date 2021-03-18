provider "azurerm" {
  version         = "=2.4.0"
  subscription_id = "dad95817-dfb9-4e87-a075-cd5c7da61d9d"
  client_id       = "3ece50b0-d8d7-4dfa-8aa9-455ffa6d9ef3"
  client_secret   = "L72-7_Kh~DbTlKBzxo3plYYDK1HD-Lev69"
  tenant_id       = "ae3ee3ae-cc1c-4edd-b3c1-4f141e64fc42"
  features {}
}
resource "azurerm_resource_group" "example" {
  name     = var.rg
  location = var.location
}
module "vnet" {
  source              = "Azure/vnet/azurerm"
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["14.0.0.0/16"]
  subnet_prefixes     = ["14.0.1.0/24", "14.0.2.0/24", "14.0.3.0/24"]
  subnet_names        = ["subnet1", "subnet2", "subnet3"]
}
