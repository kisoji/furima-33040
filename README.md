# テーブル設計

## users テーブル

| Column              | Type               | Options                                |
| --------------------|--------------------|----------------------------------------|
| nickname            | string             | null: false                            |
| email               | string             | null: false, unique: true, index: true |
| password            | encrypted_password | null: false                            |
| first_name          | string             | null: false                            |
| family_name         | string             | null: false                            |
| first_name_kana     | string             | null: false                            |
| family_name_kana    | string             | null: false                            |
| birth_day           | date               | null: false                            |

### Association

- has_many :items
- has_one :profiles
- has_one :sending_destination


## profiles テーブル

| Column             | Type       | Options                        |
| -------------------|------------|--------------------------------|                  
| introduction       | txt        |                                |
| avatar             | string     |                                |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :users

## items テーブル


| Column              | Type         | Options                        |
| --------------------| -------------|--------------------------------|
| item_img            | references   | null: false, foreign_key: true |
| name                | string       | null: false                    |
| introduction        | text         | null: false                    |
| category            | references   | null: false, foreign_key: true |
| item_condition      | references   | null: false, foreign_key: true |
| postage_type        | references   | null: false, foreign_key: true |
| prefecture_code     | integer      | null: false                    |
| preparation_day     | references   | null: false, foreign_key: true |
| price               | integer      | null: false                    |
| seller              | references   | null: false, foreign_key: true |
| buyer               | references   | foreign_key: true              |

### Association

- belongs_to :users
- Gem : jp_prefectureを使用して都道府県コードを取得

## orders テーブル

| Column               | Type         | Options                        |
| ---------------------|--------------|--------------------------------|
| user_id              | references   | null: false, foreign_key: true |
| item_id              | references   | null: false, foreign_key: true |

### Association

- has_one :sending_destination


## sending_destinations テーブル

| Column                        | Type         | Options                        |
| ------------------------------|--------------|--------------------------------|
| destination_first_name        | string       | null: false                    |
| destination_family_name       | string       | null: false                    |
| destination_first_name_kana   | string       | null: false                    |
| destination_family_name_kana  | string       | null: false                    |
| post_code                     | string       | null: false                    |
| prefecture_code               | integer      | null: false                    |
| city                          | string       | null: false                    |
| house_number                  | string       | null: false                    |
| building_name                 | string       |                                |
| phone_number                  | string       |unique: ture                    |
| user                          | references   | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :orders
- Gem : jp_prefectureを使用して都道府県コードを取得




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
