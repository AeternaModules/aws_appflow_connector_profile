variable "appflow_connector_profiles" {
  description = <<EOT
Map of appflow_connector_profiles, attributes below
Required:
    - connection_mode
    - connector_type
    - name
    - connector_profile_config (block):
        - connector_profile_credentials (required, block):
            - amplitude (optional, block):
                - api_key (required)
                - secret_key (required)
            - custom_connector (optional, block):
                - api_key (optional, block):
                    - api_key (required)
                    - api_secret_key (optional)
                - authentication_type (required)
                - basic (optional, block):
                    - password (required)
                    - username (required)
                - custom (optional, block):
                    - credentials_map (optional)
                    - custom_authentication_type (required)
                - oauth2 (optional, block):
                    - access_token (optional)
                    - client_id (optional)
                    - client_secret (optional)
                    - oauth_request (optional, block):
                        - auth_code (optional)
                        - redirect_uri (optional)
                    - refresh_token (optional)
            - datadog (optional, block):
                - api_key (required)
                - application_key (required)
            - dynatrace (optional, block):
                - api_token (required)
            - google_analytics (optional, block):
                - access_token (optional)
                - client_id (required)
                - client_secret (required)
                - oauth_request (optional, block):
                    - auth_code (optional)
                    - redirect_uri (optional)
                - refresh_token (optional)
            - honeycode (optional, block):
                - access_token (optional)
                - oauth_request (optional, block):
                    - auth_code (optional)
                    - redirect_uri (optional)
                - refresh_token (optional)
            - infor_nexus (optional, block):
                - access_key_id (required)
                - datakey (required)
                - secret_access_key (required)
                - user_id (required)
            - marketo (optional, block):
                - access_token (optional)
                - client_id (required)
                - client_secret (required)
                - oauth_request (optional, block):
                    - auth_code (optional)
                    - redirect_uri (optional)
            - redshift (optional, block):
                - password (required)
                - username (required)
            - salesforce (optional, block):
                - access_token (optional)
                - client_credentials_arn (optional)
                - jwt_token (optional)
                - oauth2_grant_type (optional)
                - oauth_request (optional, block):
                    - auth_code (optional)
                    - redirect_uri (optional)
                - refresh_token (optional)
            - sapo_data (optional, block):
                - basic_auth_credentials (optional, block):
                    - password (required)
                    - username (required)
                - oauth_credentials (optional, block):
                    - access_token (optional)
                    - client_id (required)
                    - client_secret (required)
                    - oauth_request (optional, block):
                        - auth_code (optional)
                        - redirect_uri (optional)
                    - refresh_token (optional)
            - service_now (optional, block):
                - password (required)
                - username (required)
            - singular (optional, block):
                - api_key (required)
            - slack (optional, block):
                - access_token (optional)
                - client_id (required)
                - client_secret (required)
                - oauth_request (optional, block):
                    - auth_code (optional)
                    - redirect_uri (optional)
            - snowflake (optional, block):
                - password (required)
                - username (required)
            - trendmicro (optional, block):
                - api_secret_key (required)
            - veeva (optional, block):
                - password (required)
                - username (required)
            - zendesk (optional, block):
                - access_token (optional)
                - client_id (required)
                - client_secret (required)
                - oauth_request (optional, block):
                    - auth_code (optional)
                    - redirect_uri (optional)
        - connector_profile_properties (required, block):
            - amplitude (optional, block):
            - custom_connector (optional, block):
                - oauth2_properties (optional, block):
                    - oauth2_grant_type (required)
                    - token_url (required)
                    - token_url_custom_properties (optional)
                - profile_properties (optional)
            - datadog (optional, block):
                - instance_url (required)
            - dynatrace (optional, block):
                - instance_url (required)
            - google_analytics (optional, block):
            - honeycode (optional, block):
            - infor_nexus (optional, block):
                - instance_url (required)
            - marketo (optional, block):
                - instance_url (required)
            - redshift (optional, block):
                - bucket_name (required)
                - bucket_prefix (optional)
                - cluster_identifier (optional)
                - data_api_role_arn (optional)
                - database_name (optional)
                - database_url (optional)
                - role_arn (required)
            - salesforce (optional, block):
                - instance_url (optional)
                - is_sandbox_environment (optional)
                - use_privatelink_for_metadata_and_authorization (optional)
            - sapo_data (optional, block):
                - application_host_url (required)
                - application_service_path (required)
                - client_number (required)
                - logon_language (optional)
                - oauth_properties (optional, block):
                    - auth_code_url (required)
                    - oauth_scopes (required)
                    - token_url (required)
                - port_number (required)
                - private_link_service_name (optional)
            - service_now (optional, block):
                - instance_url (required)
            - singular (optional, block):
            - slack (optional, block):
                - instance_url (required)
            - snowflake (optional, block):
                - account_name (optional)
                - bucket_name (required)
                - bucket_prefix (optional)
                - private_link_service_name (optional)
                - region (optional)
                - stage (required)
                - warehouse (required)
            - trendmicro (optional, block):
            - veeva (optional, block):
                - instance_url (required)
            - zendesk (optional, block):
                - instance_url (required)
Optional:
    - connector_label
    - kms_arn
    - region
EOT

  type = map(object({
    connection_mode = string
    connector_type  = string
    name            = string
    connector_label = optional(string)
    kms_arn         = optional(string)
    region          = optional(string)
    connector_profile_config = object({
      connector_profile_credentials = object({
        amplitude = optional(object({
          api_key    = string
          secret_key = string
        }))
        custom_connector = optional(object({
          api_key = optional(object({
            api_key        = string
            api_secret_key = optional(string)
          }))
          authentication_type = string
          basic = optional(object({
            password = string
            username = string
          }))
          custom = optional(object({
            credentials_map            = optional(map(string))
            custom_authentication_type = string
          }))
          oauth2 = optional(object({
            access_token  = optional(string)
            client_id     = optional(string)
            client_secret = optional(string)
            oauth_request = optional(object({
              auth_code    = optional(string)
              redirect_uri = optional(string)
            }))
            refresh_token = optional(string)
          }))
        }))
        datadog = optional(object({
          api_key         = string
          application_key = string
        }))
        dynatrace = optional(object({
          api_token = string
        }))
        google_analytics = optional(object({
          access_token  = optional(string)
          client_id     = string
          client_secret = string
          oauth_request = optional(object({
            auth_code    = optional(string)
            redirect_uri = optional(string)
          }))
          refresh_token = optional(string)
        }))
        honeycode = optional(object({
          access_token = optional(string)
          oauth_request = optional(object({
            auth_code    = optional(string)
            redirect_uri = optional(string)
          }))
          refresh_token = optional(string)
        }))
        infor_nexus = optional(object({
          access_key_id     = string
          datakey           = string
          secret_access_key = string
          user_id           = string
        }))
        marketo = optional(object({
          access_token  = optional(string)
          client_id     = string
          client_secret = string
          oauth_request = optional(object({
            auth_code    = optional(string)
            redirect_uri = optional(string)
          }))
        }))
        redshift = optional(object({
          password = string
          username = string
        }))
        salesforce = optional(object({
          access_token           = optional(string)
          client_credentials_arn = optional(string)
          jwt_token              = optional(string)
          oauth2_grant_type      = optional(string)
          oauth_request = optional(object({
            auth_code    = optional(string)
            redirect_uri = optional(string)
          }))
          refresh_token = optional(string)
        }))
        sapo_data = optional(object({
          basic_auth_credentials = optional(object({
            password = string
            username = string
          }))
          oauth_credentials = optional(object({
            access_token  = optional(string)
            client_id     = string
            client_secret = string
            oauth_request = optional(object({
              auth_code    = optional(string)
              redirect_uri = optional(string)
            }))
            refresh_token = optional(string)
          }))
        }))
        service_now = optional(object({
          password = string
          username = string
        }))
        singular = optional(object({
          api_key = string
        }))
        slack = optional(object({
          access_token  = optional(string)
          client_id     = string
          client_secret = string
          oauth_request = optional(object({
            auth_code    = optional(string)
            redirect_uri = optional(string)
          }))
        }))
        snowflake = optional(object({
          password = string
          username = string
        }))
        trendmicro = optional(object({
          api_secret_key = string
        }))
        veeva = optional(object({
          password = string
          username = string
        }))
        zendesk = optional(object({
          access_token  = optional(string)
          client_id     = string
          client_secret = string
          oauth_request = optional(object({
            auth_code    = optional(string)
            redirect_uri = optional(string)
          }))
        }))
      })
      connector_profile_properties = object({
        amplitude = optional(object({
        }))
        custom_connector = optional(object({
          oauth2_properties = optional(object({
            oauth2_grant_type           = string
            token_url                   = string
            token_url_custom_properties = optional(map(string))
          }))
          profile_properties = optional(map(string))
        }))
        datadog = optional(object({
          instance_url = string
        }))
        dynatrace = optional(object({
          instance_url = string
        }))
        google_analytics = optional(object({
        }))
        honeycode = optional(object({
        }))
        infor_nexus = optional(object({
          instance_url = string
        }))
        marketo = optional(object({
          instance_url = string
        }))
        redshift = optional(object({
          bucket_name        = string
          bucket_prefix      = optional(string)
          cluster_identifier = optional(string)
          data_api_role_arn  = optional(string)
          database_name      = optional(string)
          database_url       = optional(string)
          role_arn           = string
        }))
        salesforce = optional(object({
          instance_url                                   = optional(string)
          is_sandbox_environment                         = optional(bool)
          use_privatelink_for_metadata_and_authorization = optional(bool)
        }))
        sapo_data = optional(object({
          application_host_url     = string
          application_service_path = string
          client_number            = string
          logon_language           = optional(string)
          oauth_properties = optional(object({
            auth_code_url = string
            oauth_scopes  = list(string)
            token_url     = string
          }))
          port_number               = number
          private_link_service_name = optional(string)
        }))
        service_now = optional(object({
          instance_url = string
        }))
        singular = optional(object({
        }))
        slack = optional(object({
          instance_url = string
        }))
        snowflake = optional(object({
          account_name              = optional(string)
          bucket_name               = string
          bucket_prefix             = optional(string)
          private_link_service_name = optional(string)
          region                    = optional(string)
          stage                     = string
          warehouse                 = string
        }))
        trendmicro = optional(object({
        }))
        veeva = optional(object({
          instance_url = string
        }))
        zendesk = optional(object({
          instance_url = string
        }))
      })
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_label == null || ((can(regex("[0-9A-Za-z][\\w!@#.-]+", v.connector_label))) && (length(v.connector_label) >= 1 && length(v.connector_label) <= 256))
      )
    ])
    error_message = "all of: must contain only alphanumeric, exclamation point (!), at sign (@), number sign (#), period (.), and hyphen (-) characters; must be between 1 and 256 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.amplitude == null || ((length(v.connector_profile_config.connector_profile_credentials.amplitude.api_key) >= 1 && length(v.connector_profile_config.connector_profile_credentials.amplitude.api_key) <= 256) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.amplitude.api_key))))
      )
    ])
    error_message = "all of: must be between 1 and 256 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.custom_connector == null || (v.connector_profile_config.connector_profile_credentials.custom_connector.api_key == null || ((length(v.connector_profile_config.connector_profile_credentials.custom_connector.api_key.api_key) >= 1 && length(v.connector_profile_config.connector_profile_credentials.custom_connector.api_key.api_key) <= 256) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.custom_connector.api_key.api_key)))))
      )
    ])
    error_message = "all of: must be between 1 and 256 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.custom_connector == null || (v.connector_profile_config.connector_profile_credentials.custom_connector.api_key == null || (v.connector_profile_config.connector_profile_credentials.custom_connector.api_key.api_secret_key == null || ((length(v.connector_profile_config.connector_profile_credentials.custom_connector.api_key.api_secret_key) >= 1 && length(v.connector_profile_config.connector_profile_credentials.custom_connector.api_key.api_secret_key) <= 256) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.custom_connector.api_key.api_secret_key))))))
      )
    ])
    error_message = "all of: must be between 1 and 256 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.custom_connector == null || (v.connector_profile_config.connector_profile_credentials.custom_connector.custom == null || (v.connector_profile_config.connector_profile_credentials.custom_connector.custom.credentials_map == null || (alltrue([for x in v.connector_profile_config.connector_profile_credentials.custom_connector.custom.credentials_map : (length(x) >= 0 && length(x) <= 2048) && (can(regex("\\S+", x)))]))))
      )
    ])
    error_message = "all of: must be between 0 and 2048 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.custom_connector == null || (v.connector_profile_config.connector_profile_credentials.custom_connector.custom == null || (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.custom_connector.custom.custom_authentication_type))))
      )
    ])
    error_message = "must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.custom_connector == null || (v.connector_profile_config.connector_profile_credentials.custom_connector.oauth2 == null || (v.connector_profile_config.connector_profile_credentials.custom_connector.oauth2.access_token == null || ((length(v.connector_profile_config.connector_profile_credentials.custom_connector.oauth2.access_token) >= 1 && length(v.connector_profile_config.connector_profile_credentials.custom_connector.oauth2.access_token) <= 4096) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.custom_connector.oauth2.access_token))))))
      )
    ])
    error_message = "all of: must be between 1 and 4096 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.custom_connector == null || (v.connector_profile_config.connector_profile_credentials.custom_connector.oauth2 == null || (v.connector_profile_config.connector_profile_credentials.custom_connector.oauth2.oauth_request == null || (v.connector_profile_config.connector_profile_credentials.custom_connector.oauth2.oauth_request.auth_code == null || ((length(v.connector_profile_config.connector_profile_credentials.custom_connector.oauth2.oauth_request.auth_code) >= 1 && length(v.connector_profile_config.connector_profile_credentials.custom_connector.oauth2.oauth_request.auth_code) <= 4096) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.custom_connector.oauth2.oauth_request.auth_code)))))))
      )
    ])
    error_message = "all of: must be between 1 and 4096 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.custom_connector == null || (v.connector_profile_config.connector_profile_credentials.custom_connector.oauth2 == null || (v.connector_profile_config.connector_profile_credentials.custom_connector.oauth2.oauth_request == null || (v.connector_profile_config.connector_profile_credentials.custom_connector.oauth2.oauth_request.redirect_uri == null || ((length(v.connector_profile_config.connector_profile_credentials.custom_connector.oauth2.oauth_request.redirect_uri) >= 1 && length(v.connector_profile_config.connector_profile_credentials.custom_connector.oauth2.oauth_request.redirect_uri) <= 512) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.custom_connector.oauth2.oauth_request.redirect_uri)))))))
      )
    ])
    error_message = "all of: must be between 1 and 512 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.custom_connector == null || (v.connector_profile_config.connector_profile_credentials.custom_connector.oauth2 == null || (v.connector_profile_config.connector_profile_credentials.custom_connector.oauth2.refresh_token == null || ((length(v.connector_profile_config.connector_profile_credentials.custom_connector.oauth2.refresh_token) >= 1 && length(v.connector_profile_config.connector_profile_credentials.custom_connector.oauth2.refresh_token) <= 4096) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.custom_connector.oauth2.refresh_token))))))
      )
    ])
    error_message = "all of: must be between 1 and 4096 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.datadog == null || ((length(v.connector_profile_config.connector_profile_credentials.datadog.api_key) >= 1 && length(v.connector_profile_config.connector_profile_credentials.datadog.api_key) <= 256) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.datadog.api_key))))
      )
    ])
    error_message = "all of: must be between 1 and 256 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.datadog == null || ((length(v.connector_profile_config.connector_profile_credentials.datadog.application_key) >= 1 && length(v.connector_profile_config.connector_profile_credentials.datadog.application_key) <= 512) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.datadog.application_key))))
      )
    ])
    error_message = "all of: must be between 1 and 512 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.dynatrace == null || ((length(v.connector_profile_config.connector_profile_credentials.dynatrace.api_token) >= 1 && length(v.connector_profile_config.connector_profile_credentials.dynatrace.api_token) <= 256) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.dynatrace.api_token))))
      )
    ])
    error_message = "all of: must be between 1 and 256 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.google_analytics == null || (v.connector_profile_config.connector_profile_credentials.google_analytics.access_token == null || ((length(v.connector_profile_config.connector_profile_credentials.google_analytics.access_token) >= 1 && length(v.connector_profile_config.connector_profile_credentials.google_analytics.access_token) <= 2048) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.google_analytics.access_token)))))
      )
    ])
    error_message = "all of: must be between 1 and 2048 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.google_analytics == null || (v.connector_profile_config.connector_profile_credentials.google_analytics.oauth_request == null || (v.connector_profile_config.connector_profile_credentials.google_analytics.oauth_request.auth_code == null || ((length(v.connector_profile_config.connector_profile_credentials.google_analytics.oauth_request.auth_code) >= 1 && length(v.connector_profile_config.connector_profile_credentials.google_analytics.oauth_request.auth_code) <= 2048) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.google_analytics.oauth_request.auth_code))))))
      )
    ])
    error_message = "all of: must be between 1 and 2048 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.google_analytics == null || (v.connector_profile_config.connector_profile_credentials.google_analytics.oauth_request == null || (v.connector_profile_config.connector_profile_credentials.google_analytics.oauth_request.redirect_uri == null || ((length(v.connector_profile_config.connector_profile_credentials.google_analytics.oauth_request.redirect_uri) >= 1 && length(v.connector_profile_config.connector_profile_credentials.google_analytics.oauth_request.redirect_uri) <= 512) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.google_analytics.oauth_request.redirect_uri))))))
      )
    ])
    error_message = "all of: must be between 1 and 512 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.google_analytics == null || (v.connector_profile_config.connector_profile_credentials.google_analytics.refresh_token == null || ((length(v.connector_profile_config.connector_profile_credentials.google_analytics.refresh_token) >= 1 && length(v.connector_profile_config.connector_profile_credentials.google_analytics.refresh_token) <= 1024) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.google_analytics.refresh_token)))))
      )
    ])
    error_message = "all of: must be between 1 and 1024 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.honeycode == null || (v.connector_profile_config.connector_profile_credentials.honeycode.access_token == null || ((length(v.connector_profile_config.connector_profile_credentials.honeycode.access_token) >= 1 && length(v.connector_profile_config.connector_profile_credentials.honeycode.access_token) <= 2048) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.honeycode.access_token)))))
      )
    ])
    error_message = "all of: must be between 1 and 2048 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.honeycode == null || (v.connector_profile_config.connector_profile_credentials.honeycode.oauth_request == null || (v.connector_profile_config.connector_profile_credentials.honeycode.oauth_request.auth_code == null || ((length(v.connector_profile_config.connector_profile_credentials.honeycode.oauth_request.auth_code) >= 1 && length(v.connector_profile_config.connector_profile_credentials.honeycode.oauth_request.auth_code) <= 2048) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.honeycode.oauth_request.auth_code))))))
      )
    ])
    error_message = "all of: must be between 1 and 2048 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.honeycode == null || (v.connector_profile_config.connector_profile_credentials.honeycode.oauth_request == null || (v.connector_profile_config.connector_profile_credentials.honeycode.oauth_request.redirect_uri == null || ((length(v.connector_profile_config.connector_profile_credentials.honeycode.oauth_request.redirect_uri) >= 1 && length(v.connector_profile_config.connector_profile_credentials.honeycode.oauth_request.redirect_uri) <= 512) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.honeycode.oauth_request.redirect_uri))))))
      )
    ])
    error_message = "all of: must be between 1 and 512 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.honeycode == null || (v.connector_profile_config.connector_profile_credentials.honeycode.refresh_token == null || ((length(v.connector_profile_config.connector_profile_credentials.honeycode.refresh_token) >= 1 && length(v.connector_profile_config.connector_profile_credentials.honeycode.refresh_token) <= 1024) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.honeycode.refresh_token)))))
      )
    ])
    error_message = "all of: must be between 1 and 1024 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.infor_nexus == null || ((length(v.connector_profile_config.connector_profile_credentials.infor_nexus.access_key_id) >= 1 && length(v.connector_profile_config.connector_profile_credentials.infor_nexus.access_key_id) <= 256) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.infor_nexus.access_key_id))))
      )
    ])
    error_message = "all of: must be between 1 and 256 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.infor_nexus == null || ((length(v.connector_profile_config.connector_profile_credentials.infor_nexus.datakey) >= 1 && length(v.connector_profile_config.connector_profile_credentials.infor_nexus.datakey) <= 512) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.infor_nexus.datakey))))
      )
    ])
    error_message = "all of: must be between 1 and 512 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.infor_nexus == null || ((length(v.connector_profile_config.connector_profile_credentials.infor_nexus.secret_access_key) >= 1 && length(v.connector_profile_config.connector_profile_credentials.infor_nexus.secret_access_key) <= 512) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.infor_nexus.secret_access_key))))
      )
    ])
    error_message = "all of: must be between 1 and 512 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.infor_nexus == null || ((length(v.connector_profile_config.connector_profile_credentials.infor_nexus.user_id) >= 1 && length(v.connector_profile_config.connector_profile_credentials.infor_nexus.user_id) <= 512) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.infor_nexus.user_id))))
      )
    ])
    error_message = "all of: must be between 1 and 512 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.marketo == null || (v.connector_profile_config.connector_profile_credentials.marketo.access_token == null || ((length(v.connector_profile_config.connector_profile_credentials.marketo.access_token) >= 1 && length(v.connector_profile_config.connector_profile_credentials.marketo.access_token) <= 2048) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.marketo.access_token)))))
      )
    ])
    error_message = "all of: must be between 1 and 2048 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.marketo == null || (v.connector_profile_config.connector_profile_credentials.marketo.oauth_request == null || (v.connector_profile_config.connector_profile_credentials.marketo.oauth_request.auth_code == null || ((length(v.connector_profile_config.connector_profile_credentials.marketo.oauth_request.auth_code) >= 1 && length(v.connector_profile_config.connector_profile_credentials.marketo.oauth_request.auth_code) <= 512) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.marketo.oauth_request.auth_code))))))
      )
    ])
    error_message = "all of: must be between 1 and 512 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.marketo == null || (v.connector_profile_config.connector_profile_credentials.marketo.oauth_request == null || (v.connector_profile_config.connector_profile_credentials.marketo.oauth_request.redirect_uri == null || ((length(v.connector_profile_config.connector_profile_credentials.marketo.oauth_request.redirect_uri) >= 1 && length(v.connector_profile_config.connector_profile_credentials.marketo.oauth_request.redirect_uri) <= 512) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.marketo.oauth_request.redirect_uri))))))
      )
    ])
    error_message = "all of: must be between 1 and 512 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.salesforce == null || (v.connector_profile_config.connector_profile_credentials.salesforce.access_token == null || ((length(v.connector_profile_config.connector_profile_credentials.salesforce.access_token) >= 1 && length(v.connector_profile_config.connector_profile_credentials.salesforce.access_token) <= 2048) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.salesforce.access_token)))))
      )
    ])
    error_message = "all of: must be between 1 and 2048 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.salesforce == null || (v.connector_profile_config.connector_profile_credentials.salesforce.jwt_token == null || (length(v.connector_profile_config.connector_profile_credentials.salesforce.jwt_token) >= 1 && length(v.connector_profile_config.connector_profile_credentials.salesforce.jwt_token) <= 8000))
      )
    ])
    error_message = "must be between 1 and 8000 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.salesforce == null || (v.connector_profile_config.connector_profile_credentials.salesforce.oauth_request == null || (v.connector_profile_config.connector_profile_credentials.salesforce.oauth_request.auth_code == null || ((length(v.connector_profile_config.connector_profile_credentials.salesforce.oauth_request.auth_code) >= 1 && length(v.connector_profile_config.connector_profile_credentials.salesforce.oauth_request.auth_code) <= 2048) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.salesforce.oauth_request.auth_code))))))
      )
    ])
    error_message = "all of: must be between 1 and 2048 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.salesforce == null || (v.connector_profile_config.connector_profile_credentials.salesforce.oauth_request == null || (v.connector_profile_config.connector_profile_credentials.salesforce.oauth_request.redirect_uri == null || ((length(v.connector_profile_config.connector_profile_credentials.salesforce.oauth_request.redirect_uri) >= 1 && length(v.connector_profile_config.connector_profile_credentials.salesforce.oauth_request.redirect_uri) <= 512) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.salesforce.oauth_request.redirect_uri))))))
      )
    ])
    error_message = "all of: must be between 1 and 512 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.salesforce == null || (v.connector_profile_config.connector_profile_credentials.salesforce.refresh_token == null || ((length(v.connector_profile_config.connector_profile_credentials.salesforce.refresh_token) >= 1 && length(v.connector_profile_config.connector_profile_credentials.salesforce.refresh_token) <= 1024) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.salesforce.refresh_token)))))
      )
    ])
    error_message = "all of: must be between 1 and 1024 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.sapo_data == null || (v.connector_profile_config.connector_profile_credentials.sapo_data.oauth_credentials == null || (v.connector_profile_config.connector_profile_credentials.sapo_data.oauth_credentials.access_token == null || ((length(v.connector_profile_config.connector_profile_credentials.sapo_data.oauth_credentials.access_token) >= 1 && length(v.connector_profile_config.connector_profile_credentials.sapo_data.oauth_credentials.access_token) <= 2048) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.sapo_data.oauth_credentials.access_token))))))
      )
    ])
    error_message = "all of: must be between 1 and 2048 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.sapo_data == null || (v.connector_profile_config.connector_profile_credentials.sapo_data.oauth_credentials == null || (v.connector_profile_config.connector_profile_credentials.sapo_data.oauth_credentials.oauth_request == null || (v.connector_profile_config.connector_profile_credentials.sapo_data.oauth_credentials.oauth_request.auth_code == null || ((length(v.connector_profile_config.connector_profile_credentials.sapo_data.oauth_credentials.oauth_request.auth_code) >= 1 && length(v.connector_profile_config.connector_profile_credentials.sapo_data.oauth_credentials.oauth_request.auth_code) <= 2048) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.sapo_data.oauth_credentials.oauth_request.auth_code)))))))
      )
    ])
    error_message = "all of: must be between 1 and 2048 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.sapo_data == null || (v.connector_profile_config.connector_profile_credentials.sapo_data.oauth_credentials == null || (v.connector_profile_config.connector_profile_credentials.sapo_data.oauth_credentials.oauth_request == null || (v.connector_profile_config.connector_profile_credentials.sapo_data.oauth_credentials.oauth_request.redirect_uri == null || ((length(v.connector_profile_config.connector_profile_credentials.sapo_data.oauth_credentials.oauth_request.redirect_uri) >= 1 && length(v.connector_profile_config.connector_profile_credentials.sapo_data.oauth_credentials.oauth_request.redirect_uri) <= 512) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.sapo_data.oauth_credentials.oauth_request.redirect_uri)))))))
      )
    ])
    error_message = "all of: must be between 1 and 512 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.sapo_data == null || (v.connector_profile_config.connector_profile_credentials.sapo_data.oauth_credentials == null || (v.connector_profile_config.connector_profile_credentials.sapo_data.oauth_credentials.refresh_token == null || ((length(v.connector_profile_config.connector_profile_credentials.sapo_data.oauth_credentials.refresh_token) >= 1 && length(v.connector_profile_config.connector_profile_credentials.sapo_data.oauth_credentials.refresh_token) <= 1024) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.sapo_data.oauth_credentials.refresh_token))))))
      )
    ])
    error_message = "all of: must be between 1 and 1024 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.singular == null || ((length(v.connector_profile_config.connector_profile_credentials.singular.api_key) >= 1 && length(v.connector_profile_config.connector_profile_credentials.singular.api_key) <= 256) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.singular.api_key))))
      )
    ])
    error_message = "all of: must be between 1 and 256 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.slack == null || (v.connector_profile_config.connector_profile_credentials.slack.access_token == null || ((length(v.connector_profile_config.connector_profile_credentials.slack.access_token) >= 1 && length(v.connector_profile_config.connector_profile_credentials.slack.access_token) <= 2048) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.slack.access_token)))))
      )
    ])
    error_message = "all of: must be between 1 and 2048 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.slack == null || (v.connector_profile_config.connector_profile_credentials.slack.oauth_request == null || (v.connector_profile_config.connector_profile_credentials.slack.oauth_request.auth_code == null || ((length(v.connector_profile_config.connector_profile_credentials.slack.oauth_request.auth_code) >= 1 && length(v.connector_profile_config.connector_profile_credentials.slack.oauth_request.auth_code) <= 2048) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.slack.oauth_request.auth_code))))))
      )
    ])
    error_message = "all of: must be between 1 and 2048 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.slack == null || (v.connector_profile_config.connector_profile_credentials.slack.oauth_request == null || (v.connector_profile_config.connector_profile_credentials.slack.oauth_request.redirect_uri == null || ((length(v.connector_profile_config.connector_profile_credentials.slack.oauth_request.redirect_uri) >= 1 && length(v.connector_profile_config.connector_profile_credentials.slack.oauth_request.redirect_uri) <= 512) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.slack.oauth_request.redirect_uri))))))
      )
    ])
    error_message = "all of: must be between 1 and 512 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.trendmicro == null || ((length(v.connector_profile_config.connector_profile_credentials.trendmicro.api_secret_key) >= 1 && length(v.connector_profile_config.connector_profile_credentials.trendmicro.api_secret_key) <= 256) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.trendmicro.api_secret_key))))
      )
    ])
    error_message = "all of: must be between 1 and 256 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.zendesk == null || (v.connector_profile_config.connector_profile_credentials.zendesk.access_token == null || ((length(v.connector_profile_config.connector_profile_credentials.zendesk.access_token) >= 1 && length(v.connector_profile_config.connector_profile_credentials.zendesk.access_token) <= 2048) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.zendesk.access_token)))))
      )
    ])
    error_message = "all of: must be between 1 and 2048 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.zendesk == null || (v.connector_profile_config.connector_profile_credentials.zendesk.oauth_request == null || (v.connector_profile_config.connector_profile_credentials.zendesk.oauth_request.auth_code == null || ((length(v.connector_profile_config.connector_profile_credentials.zendesk.oauth_request.auth_code) >= 1 && length(v.connector_profile_config.connector_profile_credentials.zendesk.oauth_request.auth_code) <= 2048) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.zendesk.oauth_request.auth_code))))))
      )
    ])
    error_message = "all of: must be between 1 and 2048 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_credentials.zendesk == null || (v.connector_profile_config.connector_profile_credentials.zendesk.oauth_request == null || (v.connector_profile_config.connector_profile_credentials.zendesk.oauth_request.redirect_uri == null || ((length(v.connector_profile_config.connector_profile_credentials.zendesk.oauth_request.redirect_uri) >= 1 && length(v.connector_profile_config.connector_profile_credentials.zendesk.oauth_request.redirect_uri) <= 512) && (can(regex("\\S+", v.connector_profile_config.connector_profile_credentials.zendesk.oauth_request.redirect_uri))))))
      )
    ])
    error_message = "all of: must be between 1 and 512 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_properties.custom_connector == null || (v.connector_profile_config.connector_profile_properties.custom_connector.oauth2_properties == null || ((length(v.connector_profile_config.connector_profile_properties.custom_connector.oauth2_properties.token_url) >= 1 && length(v.connector_profile_config.connector_profile_properties.custom_connector.oauth2_properties.token_url) <= 256) && (can(regex("^(https?)://[0-9A-Za-z-+&@#/%?=~_|!:,.;]*[0-9A-Za-z-+&@#/%=~_|]", v.connector_profile_config.connector_profile_properties.custom_connector.oauth2_properties.token_url)))))
      )
    ])
    error_message = "all of: must be between 1 and 256 characters; must provide a valid HTTPS url"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_properties.custom_connector == null || (v.connector_profile_config.connector_profile_properties.custom_connector.oauth2_properties == null || (v.connector_profile_config.connector_profile_properties.custom_connector.oauth2_properties.token_url_custom_properties == null || (alltrue([for x in v.connector_profile_config.connector_profile_properties.custom_connector.oauth2_properties.token_url_custom_properties : (length(x) >= 0 && length(x) <= 2048) && (can(regex("\\S+", x)))]))))
      )
    ])
    error_message = "all of: must be between 0 and 2048 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_properties.custom_connector == null || (v.connector_profile_config.connector_profile_properties.custom_connector.profile_properties == null || (alltrue([for x in v.connector_profile_config.connector_profile_properties.custom_connector.profile_properties : (length(x) >= 0 && length(x) <= 2048) && (can(regex("\\S+", x)))])))
      )
    ])
    error_message = "all of: must be between 0 and 2048 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_properties.datadog == null || ((length(v.connector_profile_config.connector_profile_properties.datadog.instance_url) >= 1 && length(v.connector_profile_config.connector_profile_properties.datadog.instance_url) <= 256) && (can(regex("\\S+", v.connector_profile_config.connector_profile_properties.datadog.instance_url))))
      )
    ])
    error_message = "all of: must be between 1 and 256 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_properties.dynatrace == null || ((length(v.connector_profile_config.connector_profile_properties.dynatrace.instance_url) >= 1 && length(v.connector_profile_config.connector_profile_properties.dynatrace.instance_url) <= 256) && (can(regex("\\S+", v.connector_profile_config.connector_profile_properties.dynatrace.instance_url))))
      )
    ])
    error_message = "all of: must be between 1 and 256 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_properties.infor_nexus == null || ((length(v.connector_profile_config.connector_profile_properties.infor_nexus.instance_url) >= 1 && length(v.connector_profile_config.connector_profile_properties.infor_nexus.instance_url) <= 256) && (can(regex("\\S+", v.connector_profile_config.connector_profile_properties.infor_nexus.instance_url))))
      )
    ])
    error_message = "all of: must be between 1 and 256 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_properties.marketo == null || ((length(v.connector_profile_config.connector_profile_properties.marketo.instance_url) >= 1 && length(v.connector_profile_config.connector_profile_properties.marketo.instance_url) <= 256) && (can(regex("\\S+", v.connector_profile_config.connector_profile_properties.marketo.instance_url))))
      )
    ])
    error_message = "all of: must be between 1 and 256 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_properties.redshift == null || (v.connector_profile_config.connector_profile_properties.redshift.database_url == null || (length(v.connector_profile_config.connector_profile_properties.redshift.database_url) >= 0 && length(v.connector_profile_config.connector_profile_properties.redshift.database_url) <= 512))
      )
    ])
    error_message = "must be between 0 and 512 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_properties.salesforce == null || (v.connector_profile_config.connector_profile_properties.salesforce.instance_url == null || ((length(v.connector_profile_config.connector_profile_properties.salesforce.instance_url) >= 1 && length(v.connector_profile_config.connector_profile_properties.salesforce.instance_url) <= 256) && (can(regex("\\S+", v.connector_profile_config.connector_profile_properties.salesforce.instance_url)))))
      )
    ])
    error_message = "all of: must be between 1 and 256 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_properties.sapo_data == null || ((length(v.connector_profile_config.connector_profile_properties.sapo_data.application_host_url) >= 1 && length(v.connector_profile_config.connector_profile_properties.sapo_data.application_host_url) <= 256) && (can(regex("^(https?)://[0-9A-Za-z-+&@#/%?=~_|!:,.;]*[0-9A-Za-z-+&@#/%=~_|]", v.connector_profile_config.connector_profile_properties.sapo_data.application_host_url))))
      )
    ])
    error_message = "all of: must be between 1 and 256 characters; must provide a valid HTTPS url"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_properties.sapo_data == null || ((length(v.connector_profile_config.connector_profile_properties.sapo_data.application_service_path) >= 1 && length(v.connector_profile_config.connector_profile_properties.sapo_data.application_service_path) <= 512) && (can(regex("\\S+", v.connector_profile_config.connector_profile_properties.sapo_data.application_service_path))))
      )
    ])
    error_message = "all of: must be between 1 and 512 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_properties.sapo_data == null || ((length(v.connector_profile_config.connector_profile_properties.sapo_data.client_number) >= 3 && length(v.connector_profile_config.connector_profile_properties.sapo_data.client_number) <= 3) && (can(regex("^\\d{3}$", v.connector_profile_config.connector_profile_properties.sapo_data.client_number))))
      )
    ])
    error_message = "all of: must be between 3 and 3 characters; must consist of exactly three digits"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_properties.sapo_data == null || (v.connector_profile_config.connector_profile_properties.sapo_data.logon_language == null || ((length(v.connector_profile_config.connector_profile_properties.sapo_data.logon_language) >= 0 && length(v.connector_profile_config.connector_profile_properties.sapo_data.logon_language) <= 2) && (can(regex("^[0-9A-Za-z_]*$", v.connector_profile_config.connector_profile_properties.sapo_data.logon_language)))))
      )
    ])
    error_message = "all of: must be between 0 and 2 characters; must contain only alphanumeric characters and the underscore (_) character"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_properties.sapo_data == null || (v.connector_profile_config.connector_profile_properties.sapo_data.oauth_properties == null || ((length(v.connector_profile_config.connector_profile_properties.sapo_data.oauth_properties.auth_code_url) >= 1 && length(v.connector_profile_config.connector_profile_properties.sapo_data.oauth_properties.auth_code_url) <= 256) && (can(regex("^(https?)://[0-9A-Za-z-+&@#/%?=~_|!:,.;]*[0-9A-Za-z-+&@#/%=~_|]", v.connector_profile_config.connector_profile_properties.sapo_data.oauth_properties.auth_code_url)))))
      )
    ])
    error_message = "all of: must be between 1 and 256 characters; must provide a valid HTTPS url"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_properties.sapo_data == null || (v.connector_profile_config.connector_profile_properties.sapo_data.oauth_properties == null || (alltrue([for x in v.connector_profile_config.connector_profile_properties.sapo_data.oauth_properties.oauth_scopes : (length(x) >= 1 && length(x) <= 128) && (can(regex("\\S+", x)))])))
      )
    ])
    error_message = "all of: must be between 1 and 128 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_properties.sapo_data == null || (v.connector_profile_config.connector_profile_properties.sapo_data.oauth_properties == null || ((length(v.connector_profile_config.connector_profile_properties.sapo_data.oauth_properties.token_url) >= 1 && length(v.connector_profile_config.connector_profile_properties.sapo_data.oauth_properties.token_url) <= 256) && (can(regex("^(https?)://[0-9A-Za-z-+&@#/%?=~_|!:,.;]*[0-9A-Za-z-+&@#/%=~_|]", v.connector_profile_config.connector_profile_properties.sapo_data.oauth_properties.token_url)))))
      )
    ])
    error_message = "all of: must be between 1 and 256 characters; must provide a valid HTTPS url"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_properties.sapo_data == null || (v.connector_profile_config.connector_profile_properties.sapo_data.port_number >= 1 && v.connector_profile_config.connector_profile_properties.sapo_data.port_number <= 65535)
      )
    ])
    error_message = "must be between 1 and 65535"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_properties.sapo_data == null || (v.connector_profile_config.connector_profile_properties.sapo_data.private_link_service_name == null || ((length(v.connector_profile_config.connector_profile_properties.sapo_data.private_link_service_name) >= 1 && length(v.connector_profile_config.connector_profile_properties.sapo_data.private_link_service_name) <= 512) && (can(regex("^$|com.amazonaws.vpce.[\\w/!:@#.\\-]+", v.connector_profile_config.connector_profile_properties.sapo_data.private_link_service_name)))))
      )
    ])
    error_message = "all of: must be between 1 and 512 characters; must be a valid AWS VPC endpoint address"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_properties.service_now == null || ((length(v.connector_profile_config.connector_profile_properties.service_now.instance_url) >= 1 && length(v.connector_profile_config.connector_profile_properties.service_now.instance_url) <= 256) && (can(regex("\\S+", v.connector_profile_config.connector_profile_properties.service_now.instance_url))))
      )
    ])
    error_message = "all of: must be between 1 and 256 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_properties.slack == null || ((length(v.connector_profile_config.connector_profile_properties.slack.instance_url) >= 1 && length(v.connector_profile_config.connector_profile_properties.slack.instance_url) <= 256) && (can(regex("\\S+", v.connector_profile_config.connector_profile_properties.slack.instance_url))))
      )
    ])
    error_message = "all of: must be between 1 and 256 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_properties.snowflake == null || (v.connector_profile_config.connector_profile_properties.snowflake.account_name == null || ((length(v.connector_profile_config.connector_profile_properties.snowflake.account_name) >= 1 && length(v.connector_profile_config.connector_profile_properties.snowflake.account_name) <= 512) && (can(regex("\\S+", v.connector_profile_config.connector_profile_properties.snowflake.account_name)))))
      )
    ])
    error_message = "all of: must be between 1 and 512 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_properties.snowflake == null || (v.connector_profile_config.connector_profile_properties.snowflake.private_link_service_name == null || ((length(v.connector_profile_config.connector_profile_properties.snowflake.private_link_service_name) >= 1 && length(v.connector_profile_config.connector_profile_properties.snowflake.private_link_service_name) <= 512) && (can(regex("^$|com.amazonaws.vpce.[\\w/!:@#.\\-]+", v.connector_profile_config.connector_profile_properties.snowflake.private_link_service_name)))))
      )
    ])
    error_message = "all of: must be between 1 and 512 characters; must be a valid AWS VPC endpoint address"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_properties.snowflake == null || ((length(v.connector_profile_config.connector_profile_properties.snowflake.warehouse) >= 0 && length(v.connector_profile_config.connector_profile_properties.snowflake.warehouse) <= 512) && (can(regex("[\\s\\w/!@#+=.-]*", v.connector_profile_config.connector_profile_properties.snowflake.warehouse))))
      )
    ])
    error_message = "all of: must be between 0 and 512 characters; must match [\\s\\w/!@#+=.-]*"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_properties.veeva == null || ((length(v.connector_profile_config.connector_profile_properties.veeva.instance_url) >= 1 && length(v.connector_profile_config.connector_profile_properties.veeva.instance_url) <= 256) && (can(regex("\\S+", v.connector_profile_config.connector_profile_properties.veeva.instance_url))))
      )
    ])
    error_message = "all of: must be between 1 and 256 characters; must not contain any whitespace characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appflow_connector_profiles : (
        v.connector_profile_config.connector_profile_properties.zendesk == null || ((length(v.connector_profile_config.connector_profile_properties.zendesk.instance_url) >= 1 && length(v.connector_profile_config.connector_profile_properties.zendesk.instance_url) <= 256) && (can(regex("\\S+", v.connector_profile_config.connector_profile_properties.zendesk.instance_url))))
      )
    ])
    error_message = "all of: must be between 1 and 256 characters; must not contain any whitespace characters"
  }
  # Note: 44 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

