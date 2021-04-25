# module prepare_initial_set {
#     source = "./"

#     users = local.userlist
# }

module "preset_user" {
  source = "./modules/snowflake/preset_user/"
  users  = toset(var.users)

  providers = {
    snowflake = snowflake.accountadmin
  }
}

module "preset_resource" {
  source = "./modules/snowflake/preset_resource/"
  users  = toset(var.users)

  providers = {
    snowflake = snowflake.sysadmin
  }
}

module "resource_monitor" {
    source = "./resource_monitor/"
    
    providers = {
        snowflake = snowflake.accountadmin
    }
}
