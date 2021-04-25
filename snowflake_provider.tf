terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.24.0"
    }
  }
}

# snowflake default sysadmin provider
provider "snowflake" {
  role = "SYSADMIN"
  region = ""
  private_key_path = var.snowlake_private_key_path
}

# snowflake sysadmin provider
provider "snowflake" {
  alias  = "sysadmin"
  role   = "SYSADMIN"
  region = ""
  private_key_path = var.snowlake_private_key_path
}

# snowflake orgadmin provider
provider "snowflake" {
  alias  = "orgadmin"
  role   = "ORGADMIN"
  region = ""
  private_key_path = var.snowlake_private_key_path
}

# snowflake accountadmin provider
provider "snowflake" {
  alias  = "accountadmin"
  role   = "ACCOUNTADMIN"
  region = ""
  private_key_path = var.snowlake_private_key_path
}

# snowflake accountadmin provider
provider "snowflake" {
  alias  = "useradmin"
  role   = "USERADMIN"
  region = ""
  private_key_path = var.snowlake_private_key_path
}

# snowflake admin provider
provider "snowflake" {
  alias = "admin"
  role = "ACCOUNTADMIN"
  region = ""
  username = var.snowflake_admin_user
  password = var.snowflake_admin_password
}
