# TODO: warehouse, dbはメールアドレスの@の手前までにする
# メールアドレスじゃないもので登録しようとしたら、どっかでバリデーションして弾く(merge requestとか？)

resource "snowflake_user" "preset_user" {
  for_each = var.users

  name                 = each.value
  email                = each.value
  password             = "Snowflake_1234" # SSOが使えるようになったら disable したい
  must_change_password = true
  default_namespace = "${replace(element(split("@", upper(each.value)), 0), ".", "_")}_DB"
  default_warehouse = "${replace(element(split("@", upper(each.value)), 0), ".", "_")}_WH"
  default_role = "SYSADMIN"
}

resource "snowflake_role_grants" "preset_role_grants" {
  role_name = "SYSADMIN"
  users     = toset(concat(tolist(var.users), ["terraform"]))
  roles = [
    "ACCOUNTADMIN"
  ]

  depends_on = [
    snowflake_user.preset_user
  ]
}

