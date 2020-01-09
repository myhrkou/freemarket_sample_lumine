# freemarket_sample_lumine
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|address_zip|string|null: false|
|address_prefecture|string|null: false|
|adderess_city|string|null: false|
|adddress_number|string|null: false|
|adddress_building|string||
|phone_number|integer||
### Association
- has_many :cards
- has_many :items

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|number|string|null: false, unique: true|
|expiration_date|integer|null: false|
|security_number|integer|null: false|
|user_id|integer|null: false,foreign_key: true|
### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|item_condition|string|null: false|
|delivery_charge_detail|string|null: false|
|delivery_origin|string|null: false|
|delivery_date|string|null: false|
|price|integer|null: false|
|user_id|integer|null: false,foreign_key: true|
|evaluation_id|integer|null: false,foreign_key: true|
|category_id|integer|null: false,foreign_key: true|
### Association
- belongs_to :user
- belongs_to :evaluation
- belongs_to :category
- has_many :items_images

## items_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image_url|string|null: false|
|item_id|integer|null: false,foreign_key: true|
### Association
- belongs_to :item

## evaluationテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
- belongs_to :item

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
- belongs_to :item
