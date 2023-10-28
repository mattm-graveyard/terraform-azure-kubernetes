resource "azurerm_kubernetes_cluster" "mainkub" {
  name = var.kube_cluster_name
  location = azurerm_resource_group.kub-rg.location
  resource_group_name = azurerm_resource_group.kub-rg.name
  dns_prefix = var.dns_prefix
  
  default_node_pool {
    name = var.default_npool_name
    node_count = 2
    vm_size = "Standard_DS2_v2"
    vnet_subnet_id = azurerm_subnet.kubinternal.id                                       #cluster running on internal network
  }

  identity {
    type = "SystemAssigned"
  }

  oms_agent {                                                                            #Assigns workspace to kubernetes cluster 
    log_analytics_workspace_id = azurerm_log_analytics_workspace.logwork.id       
    msi_auth_for_monitoring_enabled = true                                               #Enables managed identity authentication for monitoring 
  }

  private_cluster_enabled = true
}

resource "azurerm_kubernetes_cluster_node_pool" "secondary" {                            #Creates a 2nd node pool within the same cluster 
  name = var.secondary_npool_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.mainkub.id
  vm_size = "Standard_DS2_v2"
  node_count = 1
  vnet_subnet_id = azurerm_subnet.kubinternal.id
}

resource "azurerm_log_analytics_workspace" "logwork" {                                   #Sets up log analytics worksapce
  name = var.workspace_log_name
  resource_group_name = azurerm_resource_group.kub-rg.name
  location = azurerm_resource_group.kub-rg.location
  sku = "PerGB2018"
}

resource "azurerm_log_analytics_solution" "logsolution" {                                #Sets up analytics solution 
  solution_name = "Containers"
  resource_group_name = azurerm_resource_group.kub-rg.name
  location = azurerm_resource_group.kub-rg.location
  workspace_resource_id = azurerm_log_analytics_workspace.logwork.id
  workspace_name = azurerm_log_analytics_workspace.logwork.name

  plan {
    publisher = "Microsoft"
    product = "OMSGallery/Containers"
  }
}