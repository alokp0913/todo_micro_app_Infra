module "RG" {
  source = "../../Micro_Infra_Modules/Azurerm_resource_group"
  rginfo = var.rginfo
}

module "vnet" {
  depends_on = [module.RG]
  source     = "../../Micro_Infra_Modules/azurerm_Virtual_network"
  vnet_info  = var.vnet_info
}


module "pip" {
  depends_on = [module.RG]
  source     = "../../Micro_Infra_Modules/azurerm_Public_ip"
  pip_info   = var.pip_info

}



module "sqlserver" {
  depends_on = [ module.RG ]
  source     = "../../Micro_Infra_Modules/azurerm_Mssql_server"
  sql_server = var.sql_server

}


module "sqldb" {
  depends_on = [module.RG, module.sqlserver]
  source     = "../../Micro_Infra_Modules/azurerm_mssql_db"
  sql_db     = var.sql_db

}


module "acr" {
  depends_on = [ module.RG ]
  source = "../../Micro_Infra_Modules/azurerm_azure_container_registry"
  acr = var.acr
  
}


module "aks" {
  depends_on = [ module.acr, module.RG ]
  source = "../../Micro_Infra_Modules/azurerm_AKS"
  aks = var.aks
  
}