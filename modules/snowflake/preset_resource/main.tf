# TODO: warehouse, dbはメールアドレスの@の手前までにする
# メールアドレスじゃないもので登録しようとしたら、どっかでバリデーションして弾く(merge requestとか？)

resource "snowflake_warehouse" "preset_wh" {
  for_each = var.users

  name = "${replace(element(split("@", upper(each.value)), 0), ".", "_")}_WH"
  warehouse_size      = "xsmall"
  auto_suspend        = 150
  initially_suspended = true
}

resource "snowflake_database" "preset_db" {
  for_each = var.users

  name = "${replace(element(split("@", upper(each.value)), 0), ".", "_")}_DB"
}
