# Resource Group
resource "azurerm_resource_group" "rg1" {
  location = "eastus"
  name     = "MSUCoffee"
}

# Storage Account
resource "azurerm_storage_account" "storage" {
  name                     = "contosecoffestorage"
  resource_group_name      = azurerm_resource_group.rg1.name
  location                 = "uks"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

# App Service Plan - London
resource "azurerm_service_plan" "lasp" {
  name                = "ASP-MSUCoffee-9329"
  location            = "uks"
  resource_group_name = azurerm_resource_group.rg1.name
  os_type             = "Windows"
  sku_name            = "B1"
}

# App Service - London
resource "azurerm_windows_web_app" "las" {
  name                = "londoncoffeewebapp123"
  location            = "uks"
  resource_group_name = azurerm_resource_group.rg1.name
  service_plan_id     = azurerm_service_plan.lasp.id

  site_config {}
}

# App Service Plan - New York
resource "azurerm_service_plan" "nyasp" {
  name                = "ASP-MSUCoffee-ab54"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.rg1.name
  os_type             = "Windows"
  sku_name            = "B1"
}

# App Service - New York
resource "azurerm_windows_web_app" "nyas" {
  name                = "nycoffeewebapp123"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.rg1.name
  service_plan_id     = azurerm_service_plan.nyasp.id

  site_config {}
}

# Traffic Manager Profile
resource "azurerm_traffic_manager_profile" "tmp" {
  name                   = "Coffeetraffic"
  resource_group_name    = azurerm_resource_group.rg1.name
  traffic_routing_method = "Performance"

  dns_config {
    relative_name = "dnsconfig"
    ttl           = 60
  }

  monitor_config {
    protocol                     = "HTTPS"
    port                         = 443
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 10
    tolerated_number_of_failures = 3
  }

  tags = {
    environment = "Production"
  }
}

# London Endpoint
resource "azurerm_traffic_manager_azure_endpoint" "lep" {
  name               = "londonendpoint"
  profile_id         = azurerm_traffic_manager_profile.tmp.id
  weight             = 100
  target_resource_id = azurerm_windows_web_app.las.id
}

# New York Endpoint
resource "azurerm_traffic_manager_azure_endpoint" "nyep" {
  name               = "nyendpoint"
  profile_id         = azurerm_traffic_manager_profile.tmp.id
  weight             = 100
  target_resource_id = azurerm_windows_web_app.nyas.id
}
