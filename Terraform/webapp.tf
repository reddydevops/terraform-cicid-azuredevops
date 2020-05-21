 terraform {
  required_version = ">= 0.11" 
 backend "azurerm" {
  storage_account_name = "storebackend"
    container_name       = "terraform"
    key                  = "terraform.tfstate"
	access_key  ="bonOwk0Pnr2koCnbmAp/H4QFE0MLi2CY1RZNZmYEGAafLfMvLQDvSnniX+jqqkYz27GxEQSIp3pVeVlOALFAGQ=="
	}
	}
  provider "azurerm" {
        features {}
}
resource "azurerm_resource_group" "dev" {
  name     = "__appresourcegroup__"
  location = "__appresourcelocation__"
}

resource "azurerm_app_service_plan" "dev" {
  name                = "__appserviceplan__"
  location            = "${azurerm_resource_group.dev.location}"
  resource_group_name = "${azurerm_resource_group.dev.name}"

  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "dev" {
  name                = "__appservicename__"
  location            = "${azurerm_resource_group.dev.location}"
  resource_group_name = "${azurerm_resource_group.dev.name}"
  app_service_plan_id = "${azurerm_app_service_plan.dev.id}"

}
