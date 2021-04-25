# Terraforming for Snwoflake Sandbox environment

Sandbox用のSnowflake環境をとりあえず吐き出す用のTerraformです。
社内で管理する検証用にいかがでしょうか。

ユーザのメールアドレスリストをインプットにして
- ユーザ
- ユーザへのSYSADMIN権限付与
- ユーザ毎のDB作成
- ユーザ毎のwarehouse作成
これらを作成します。

# 事前準備
## terraformアカウント用に rsa key を発行する

https://docs.snowflake.com/ja/user-guide/key-pair-auth.html

```sh
$ openssl genrsa 2048 | openssl pkcs8 -topk8 -inform PEM -out rsa_key.p8
$ openssl rsa -in rsa_key.p8 -pubout -out rsa_key.pub
```

## terraformユーザを作成する

システム管理アカウント（初期発行のアドミンアカウント）を用いて、terraformユーザを作成する。
その際に、最初に作成した公開鍵情報をterraformユーザに付与する。
今回は rsa key を用いた認証でterraformを扱うが、パスワードを用いる場合は適宜パスワードのパラメータとして読み替えてください。

```sql
CREATE USER terraform rsa_public_key ='ABCDEF....';
```

## terraformユーザに環境構築のための権限を付与する

https://docs.snowflake.com/ja/sql-reference/sql/grant-role.html

```sql
GRANT ROLE ACCOUNTADMIN TO USER terraform;
GRANT ROLE SYSADMIN TO USER terraform;
```

# 実行

## .env.sample を元に、環境変数を用意する

```env
export SNOWFLAKE_ACCOUNT="YOUR_SNOWFLAKE_ACCOUNT"
export SNOWFLAKE_USER="terraform"
export TF_VAR_snowlake_private_key_path="~/rsa_key.p8"

export TF_VAR_snowflake_admin_user="YOUR_SNOWFLAKE_ADMIN_ACCOUNT"
export TF_VAR_snowflake_admin_password="YOUR_SNOWFLAKE_ADMIN_PASSWORD"

```

## variables.tf にユーザ名をメールアドレスで追加する

```tf
variable "users" {
  default = [
    "sample@snowflake.terraform", # 追記
    # "terraform" # システムユーザ
    # "dedadmin" # adminユーザ
  ]
}

...
```

## デプロイ

```sh
$ terraform init
$ terraform plan
$ terraform apply
```
