data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

module "recovery_services_vault" {
  source   = "Azure/avm-res-recoveryservices-vault/azurerm"
  version  = "1.3.3"
  for_each = var.recovery_services_vaults

  name                                           = each.value.name
  location                                       = var.location
  resource_group_name                            = var.resource_group_name
  tags                                           = coalesce(each.value.tags, var.tags)
  enable_telemetry                               = coalesce(each.value.enable_telemetry, var.enable_telemetry)
  alerts_for_all_job_failures_enabled            = each.value.alerts_for_all_job_failures_enabled
  workload_backup_policy                         = each.value.workload_backup_policy
  backup_protected_vm                            = each.value.backup_protected_vm
  diagnostic_settings                            = each.value.diagnostic_settings
  ignore_body_changes                            = each.value.ignore_body_changes
  role_assignments                               = each.value.role_assignments
  backup_protected_workload                      = each.value.backup_protected_workload
  private_endpoints                              = each.value.private_endpoints
  alerts_for_all_replication_issues_enabled      = each.value.alerts_for_all_replication_issues_enabled
  cross_region_restore_enabled                   = each.value.cross_region_restore_enabled
  lock                                           = each.value.lock
  managed_identities                             = each.value.managed_identities
  resource_guard_id                              = each.value.resource_guard_id
  storage_mode_type                              = each.value.storage_mode_type
  alerts_for_critical_operation_failures_enabled = each.value.alerts_for_critical_operation_failures_enabled
  resource_guard_operation_requests              = each.value.resource_guard_operation_requests
  sku                                            = each.value.sku
  classic_vmware_replication_enabled             = each.value.classic_vmware_replication_enabled
  customer_managed_key                           = each.value.customer_managed_key
  file_share_backup_policy                       = each.value.file_share_backup_policy
  immutability                                   = each.value.immutability
  public_network_access_enabled                  = each.value.public_network_access_enabled
  retry                                          = each.value.retry
  site_recovery_replicated_vm                    = each.value.site_recovery_replicated_vm
  private_endpoints_manage_dns_zone_group        = each.value.private_endpoints_manage_dns_zone_group
  resource_types                                 = each.value.resource_types
  soft_delete_enabled                            = each.value.soft_delete_enabled
  timeouts                                       = each.value.timeouts
  backup_protected_file_share                    = each.value.backup_protected_file_share
  resource_guard_association_enabled             = each.value.resource_guard_association_enabled
  vm_backup_policy                               = each.value.vm_backup_policy
  alerts_for_all_failover_issues_enabled         = each.value.alerts_for_all_failover_issues_enabled
}
