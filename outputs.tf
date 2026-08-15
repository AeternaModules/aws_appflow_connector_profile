output "appflow_connector_profiles_id" {
  description = "Map of id values across all appflow_connector_profiles, keyed the same as var.appflow_connector_profiles"
  value       = { for k, v in aws_appflow_connector_profile.appflow_connector_profiles : k => v.id if v.id != null && length(v.id) > 0 }
}
output "appflow_connector_profiles_arn" {
  description = "Map of arn values across all appflow_connector_profiles, keyed the same as var.appflow_connector_profiles"
  value       = { for k, v in aws_appflow_connector_profile.appflow_connector_profiles : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "appflow_connector_profiles_connection_mode" {
  description = "Map of connection_mode values across all appflow_connector_profiles, keyed the same as var.appflow_connector_profiles"
  value       = { for k, v in aws_appflow_connector_profile.appflow_connector_profiles : k => v.connection_mode if v.connection_mode != null && length(v.connection_mode) > 0 }
}
output "appflow_connector_profiles_connector_label" {
  description = "Map of connector_label values across all appflow_connector_profiles, keyed the same as var.appflow_connector_profiles"
  value       = { for k, v in aws_appflow_connector_profile.appflow_connector_profiles : k => v.connector_label if v.connector_label != null && length(v.connector_label) > 0 }
}
output "appflow_connector_profiles_connector_profile_config" {
  description = "Map of connector_profile_config values across all appflow_connector_profiles, keyed the same as var.appflow_connector_profiles"
  value       = { for k, v in aws_appflow_connector_profile.appflow_connector_profiles : k => one(v.connector_profile_config) if v.connector_profile_config != null && length(v.connector_profile_config) > 0 }
  sensitive   = true
}
output "appflow_connector_profiles_connector_type" {
  description = "Map of connector_type values across all appflow_connector_profiles, keyed the same as var.appflow_connector_profiles"
  value       = { for k, v in aws_appflow_connector_profile.appflow_connector_profiles : k => v.connector_type if v.connector_type != null && length(v.connector_type) > 0 }
}
output "appflow_connector_profiles_credentials_arn" {
  description = "Map of credentials_arn values across all appflow_connector_profiles, keyed the same as var.appflow_connector_profiles"
  value       = { for k, v in aws_appflow_connector_profile.appflow_connector_profiles : k => v.credentials_arn if v.credentials_arn != null && length(v.credentials_arn) > 0 }
}
output "appflow_connector_profiles_kms_arn" {
  description = "Map of kms_arn values across all appflow_connector_profiles, keyed the same as var.appflow_connector_profiles"
  value       = { for k, v in aws_appflow_connector_profile.appflow_connector_profiles : k => v.kms_arn if v.kms_arn != null && length(v.kms_arn) > 0 }
}
output "appflow_connector_profiles_name" {
  description = "Map of name values across all appflow_connector_profiles, keyed the same as var.appflow_connector_profiles"
  value       = { for k, v in aws_appflow_connector_profile.appflow_connector_profiles : k => v.name if v.name != null && length(v.name) > 0 }
}
output "appflow_connector_profiles_region" {
  description = "Map of region values across all appflow_connector_profiles, keyed the same as var.appflow_connector_profiles"
  value       = { for k, v in aws_appflow_connector_profile.appflow_connector_profiles : k => v.region if v.region != null && length(v.region) > 0 }
}

