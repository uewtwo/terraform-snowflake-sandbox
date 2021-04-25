
resource "snowflake_warehouse" "sys_wh" {
  provider       = snowflake.accountadmin
  name           = "SYS_WH"
  warehouse_size = "xsmall"
}

resource "snowflake_role_grants" "user_role_grant" {
  provider  = snowflake.admin
  role_name = "USERADMIN"
  roles = [
    "SECURITYADMIN",
  ]
  users = [
    "terraform",
  ]
}
