# テーブル設計

## users テーブル

| Column             | Type    | Options                      |
| ------------------ | ------- | ---------------------------- |
| nickname           | string  | null: false, unique: true    |
| email              | string  | null: false, unique: true    |
| encrypted_password | string  | null: false                  |
| last_name          | string  | null: false                  |
| first_name         | string  | null: false                  |
| last_name_kana     | string  | null: false                  |
| first_name_kana    | string  | null: false                  |
| birth_year_id      | integer | null: false                  |
| birth_month_id     | integer | null: false                  |
| birth_day_id       | integer | null: false                  |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -------------------------------|
| title              | string     | null: false                    |
| content            | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shipping_fee_id    | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipping_time_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| sales_commission   | integer    | null: false                    |
| profit             | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record

## purchase_records テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :address

## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| adress          | string     | null: false                    |
| building        | string     | null: false                    |
| phone_number    | string     | null: falseD                   |
| purchase_record | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record