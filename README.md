# テーブル設計

## users テーブル

| Column              | Type   | Options                                |
| --------------------|--------|----------------------------------------|
| nickname            | string | null: false                            |
| email               | string | null: false, unique: true, index: true |
| password            | string | null: false                            |
| first_name          | string | null: false                            |
| family_name         | string | null: false                            |
| first_name_kana     | string | null: false                            |
| family_name_kana    | string | null: false                            |
| birth_year          | date   | null: false                            |
| birth_month         | date   | null: false                            |
| birth_day           | date   | null: false                            |

### Association

- has_many :items
- has_one :profiles
- has_one :sending_destination
- has_one :credit_card

## profiles テーブル

| Column             | Type       | Options                        |
| -------------------|------------|--------------------------------|                  
| introduction       | txt        |                                |
| avatar             | string     |                                |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## items テーブル

| Column              | Type         | Options                        |
| --------------------| -------------|--------------------------------|
| name                | string       | null: false                    |
| introduction        | text         | null: false                    |
| price               | integer      | null: false                    |
| brand               | references   | foreign_key: true              |
| item_condition      | references   | null: false, foreign_key: true |
| postage_payer       | references   | null: false, foreign_key: true |
| prefecture_code     | integer      | null: false                    |
| size                | references   | null: false, foreign_key: true |
| preparation_day     | references   | null: false, foreign_key: true |
| postage_type        | references   | null: false, foreign_key: true |
| item_img            | references   | null: false, foreign_key: true |
| category            | references   | null: false, foreign_key: true |
| trading_status      | enum         | null: false                    |
| seller              | references   | null: false, foreign_key: true |
| buyer               | references   | foreign_key: true              |
| deal_closed_date    | timestamp    |                                |

### Association

- belongs_to :users
- Gem : jp_prefectureを使用して都道府県コードを取得

## sending_destinations テーブル

| Column                        | Type         | Options                        |
| ------------------------------|--------------|--------------------------------|
| destination_first_name        | string       | null: false                    |
| destination_family_name       | string       | null: false                    |
| destination_first_name_kana   | string       | null: false                    |
| destination_family_name_kana  | string       | null: false                    |
| post_code                     | integer(7)   | null: false                    |
| prefecture_code               | integer      | null: false                    |
| city                          | string       | null: false                    |
| house_number                  | string       | null: false                    |
| building_name                 | string       |                                |
| phone_number                  | integer      |unique: ture                    |
| user                          | references   | null: false, foreign_key: true |

### Association

- belongs_to :users
- Gem : jp_prefectureを使用して都道府県コードを取得

## credit_cards テーブル

| Column                        | Type         | Options                        |
| ------------------------------|--------------|--------------------------------|
| card_number                   | integer      | null: false, unique:true       |
| expiration_year               | integer      | null: false                    |
| expiration_month              | integer      | null: false                    |
| security_code                 | integer      | null: false                    |
| user                          | references   | null: false, foreign_key: true |

### Association

- belongs_to :users


# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
