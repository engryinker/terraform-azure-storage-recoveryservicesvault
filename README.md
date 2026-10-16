# terraform-azure-storage-recoveryservicesvault

Org-standard Terraform wrapper for: **Recovery Services vaults (backup/ASR)**.

Deploys into an existing resource group (passed in via `resource_group_name` / `location`) -- this module does not create the resource group itself. Compose with [terraform-azure-naming](https://github.com/engryinker/terraform-azure-naming) for names and [terraform-azure-tags](https://github.com/engryinker/terraform-azure-tags) for the `tags` input.

## Usage

```hcl
module "storage-recoveryservicesvault" {
  source = "git::https://github.com/engryinker/terraform-azure-storage-recoveryservicesvault.git?ref=v1.0.0"

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  tags                = module.tags.tags

  recovery_services_vaults = {
    example = {
      # see Inputs below -- every field upstream supports, see linked AVM module docs for the full schema
    }
  }
}
```

See [`examples/basic`](examples/basic) for a minimal runnable (zero-instance) example.

## Inputs

Beyond the standard `resource_group_name`, `location`, `tags`, `enable_telemetry` module-level variables, each map variable below mirrors its upstream AVM module's inputs 1:1 (fields typed `any` carry complex nested upstream schemas -- see the linked module docs):

### `recovery_services_vaults` (Recovery Services vaults (backup/ASR))

Wraps [Azure/avm-res-recoveryservices-vault/azurerm](https://registry.terraform.io/modules/Azure/avm-res-recoveryservices-vault/azurerm/1.3.3) v1.3.3.

| Field | Type | Required | Notes |
| --- | --- | --- | --- |
| `name` | `string` | yes | Resource name. |
| `alerts_for_all_job_failures_enabled` | `bool` | no |  |
| `workload_backup_policy` | `any` | no |  |
| `backup_protected_vm` | `any` | no |  |
| `diagnostic_settings` | `any` | no |  |
| `ignore_body_changes` | `any` | no |  |
| `role_assignments` | `any` | no |  |
| `backup_protected_workload` | `any` | no |  |
| `private_endpoints` | `any` | no |  |
| `alerts_for_all_replication_issues_enabled` | `bool` | no |  |
| `cross_region_restore_enabled` | `bool` | no |  |
| `lock` | `any` | no |  |
| `managed_identities` | `any` | no |  |
| `resource_guard_id` | `string` | no |  |
| `storage_mode_type` | `string` | no |  |
| `alerts_for_critical_operation_failures_enabled` | `bool` | no |  |
| `resource_guard_operation_requests` | `list(string)` | no |  |
| `sku` | `string` | yes |  |
| `classic_vmware_replication_enabled` | `bool` | no |  |
| `customer_managed_key` | `any` | no |  |
| `file_share_backup_policy` | `any` | no |  |
| `immutability` | `string` | no |  |
| `public_network_access_enabled` | `bool` | no |  |
| `retry` | `any` | no |  |
| `site_recovery_replicated_vm` | `any` | no |  |
| `private_endpoints_manage_dns_zone_group` | `bool` | no |  |
| `resource_types` | `any` | no |  |
| `soft_delete_enabled` | `string` | no |  |
| `timeouts` | `any` | no |  |
| `backup_protected_file_share` | `any` | no |  |
| `resource_guard_association_enabled` | `bool` | no |  |
| `vm_backup_policy` | `any` | no |  |
| `alerts_for_all_failover_issues_enabled` | `bool` | no |  |
| `tags` | `map(string)` | no | Overrides the module-level `tags` for this entry only. |
| `enable_telemetry` | `bool` | no | Overrides the module-level `enable_telemetry` for this entry only. |

## Outputs

- `recovery_services_vaults` -- map (same keys as the input) of every output from each created Recovery Services vaults (backup/ASR).
