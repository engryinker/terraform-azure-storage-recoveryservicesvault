output "recovery_services_vaults" {
  description = "Map (same keys as var.recovery_services_vaults) of every output from each Recovery Services vaults (backup/ASR) created -- see upstream module docs for the full shape."
  value       = module.recovery_services_vault
}
