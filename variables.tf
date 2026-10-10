variable "resource_group_name" {
  description = "Name of the existing resource group to deploy every resource in this module call into. This module does not create the resource group itself."
  type        = string
}

variable "location" {
  description = "Azure region for every resource created by this module call."
  type        = string
}

variable "tags" {
  description = "Default tags applied to every resource created by this module call (e.g. the output of terraform-azure-tags). Overridden per-resource by that resource's own `tags` attribute, if set."
  type        = map(string)
  default     = {}
}

variable "enable_telemetry" {
  description = "Default AVM telemetry opt-in/out applied to every resource created by this module call. See https://aka.ms/avm/telemetry. Overridden per-resource by that resource's own `enable_telemetry` attribute, if set."
  type        = bool
  default     = true
}

variable "recovery_services_vaults" {
  description = "Map of Recovery Services vaults (backup/ASR) to create, keyed by an arbitrary caller-chosen map key. Mirrors the inputs of Azure/avm-res-recoveryservices-vault/azurerm v1.3.3 (https://registry.terraform.io/modules/Azure/avm-res-recoveryservices-vault/azurerm/1.3.3) 1:1 -- see upstream docs for the schema of any field typed `any`. `name`, `tags` and `enable_telemetry` (where present upstream) are handled specially by this wrapper; every other field is passed straight through unmodified."
  type = map(object({
    name                                           = string
    tags                                           = optional(map(string))
    enable_telemetry                               = optional(bool)
    alerts_for_all_job_failures_enabled            = optional(bool, null)
    workload_backup_policy                         = optional(any, null)
    backup_protected_vm                            = optional(any, null)
    diagnostic_settings                            = optional(any, null)
    ignore_body_changes                            = optional(any, null)
    role_assignments                               = optional(any, null)
    backup_protected_workload                      = optional(any, null)
    private_endpoints                              = optional(any, null)
    alerts_for_all_replication_issues_enabled      = optional(bool, null)
    cross_region_restore_enabled                   = optional(bool, null)
    lock                                           = optional(any, null)
    managed_identities                             = optional(any, null)
    resource_guard_id                              = optional(string, null)
    storage_mode_type                              = optional(string, null)
    alerts_for_critical_operation_failures_enabled = optional(bool, null)
    resource_guard_operation_requests              = optional(list(string), null)
    sku                                            = string
    classic_vmware_replication_enabled             = optional(bool, null)
    customer_managed_key                           = optional(any, null)
    file_share_backup_policy                       = optional(any, null)
    immutability                                   = optional(string, null)
    public_network_access_enabled                  = optional(bool, null)
    retry                                          = optional(any, null)
    site_recovery_replicated_vm                    = optional(any, null)
    private_endpoints_manage_dns_zone_group        = optional(bool, null)
    resource_types                                 = optional(any, null)
    soft_delete_enabled                            = optional(string, null)
    timeouts                                       = optional(any, null)
    backup_protected_file_share                    = optional(any, null)
    resource_guard_association_enabled             = optional(bool, null)
    vm_backup_policy                               = optional(any, null)
    alerts_for_all_failover_issues_enabled         = optional(bool, null)
  }))
  default = {}
}
