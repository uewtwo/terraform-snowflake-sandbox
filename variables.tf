variable "users" {
  default = [
    "aaa@foobar.com"

    # "terraform" # システムユーザ
    # "dedadmin" # adminユーザ
  ]
}


variable "snowlake_private_key_path" {}
variable "snowflake_admin_user" {}
variable "snowflake_admin_password" {}
