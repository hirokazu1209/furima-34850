# テーブル設計

## users テーブル

| Column             | Type   | Options       |
| ------------------ | ------ | ------------- |
| nickname           | string | null  : false |
| email              | string | unique: true  |
| encrypted_password | string | null  : false |
| first_name         | string | null  : false |
| last_name          | string | null  : false |
| first_name_reading | string | null  : false |
| last_name_reading  | string | null  : false |
| birthday           | date   | null  : false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| item_name              | string     | null: false                    |
| item_description       | string     | null: false                    |
| item_price             | int        | null: false                    |
| prefecture_id          | integer    | null: false                    |
| item_condition_id      | integer    | null: false                    |
| shipping_fee_burden_id | integer    | null: false                    |
| shipment_source_id     | integer    | null: false                    |
| day_to_ship_id         | integer    | null: false                    |
| category_id            | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order

## orders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one    :address