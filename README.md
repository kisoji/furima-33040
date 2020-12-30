# テーブル設計

## users テーブル

| Column              | Type               | Options                                |
| --------------------|--------------------|----------------------------------------|
| nickname            | string             | null: false                            |
| email               | string             | null: false, unique: true              |
| password            | encrypted_password | null: false                            |
| first_name          | string             | null: false                            |
| family_name         | string             | null: false                            |
| first_name_kana     | string             | null: false                            |
| family_name_kana    | string             | null: false                            |
| birth_day           | date               | null: false                            |

### Association

- has_many :items
- has_one :profiles
- has_one :order


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
| name                | string       | null: false                    |
| introduction        | text         | null: false                    |
| category_id         | integer      | null: false, foreign_key: true |
| price               | integer      | null: false                    |
| user                | references   | null: false, foreign_key: true |
|                     |              |                                |

### Association

- belongs_to :user


## orders テーブル

| Column               | Type         | Options                        |
| ---------------------|--------------|--------------------------------|
| user                 | references   | null: false, foreign_key: true |
| item                 | references   | null: false, foreign_key: true |

### Association

- has_one :sending_destination


## sending_destinations テーブル

| Column                        | Type         | Options                        |
| ------------------------------|--------------|--------------------------------|
| post_code                     | string       | null: false                    |
| prefecture_code_id            | integer      | null: false                    |
| city                          | string       | null: false                    |
| house_number                  | string       | null: false                    |
| building_name                 | string       |                                |
| phone_number                  | string       | null: false, unique: true      |
| item                          | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order




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
