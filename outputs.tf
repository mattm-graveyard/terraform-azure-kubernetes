output "cluster_id" {
  value = azurerm_kubernetes_cluster.mainkub.id
}

output "kube_config" {                                                                              #Output to be used by kubectl or other tools
  value = azurerm_kubernetes_cluster.mainkub.kube_config_raw
  sensitive = true
}

output "kube_client_key" {                                                                          #private key used by clients to authetnicate to Kube clsuter
  value = azurerm_kubernetes_cluster.mainkub.kube_config.0.client_key
  sensitive = true
}

output "kube_client_cert" {                                                                         #public certificate used by clients to authenticate to Kube cluster
  value = azurerm_kubernetes_cluster.mainkub.kube_config.0.client_certificate
  sensitive = true
}

output "cluster_ca_cert" {                                                                          #public CA certificate used as the root of trust for Kube cluster 
  value = azurerm_kubernetes_cluster.mainkub.kube_config.0.cluster_ca_certificate
  sensitive = true
}

output "kube_host" {                                                                                #Kube Server Host
  value = azurerm_kubernetes_cluster.mainkub.kube_config.0.host
  sensitive = true
}