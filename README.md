# freemarket_sample_lumine
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|mail_address|string|null: false|
|password|string|null: false|
|name|string|null: false|
|birth_time|integer|null: false|
|live_number_address|string|null: false|
|live_prefecture|string|null: false|
|live_municipalities|string|null: false|
|live_address|string|null: false|
|phone_number|integer||
|building_name|string||
### Association
- has_many :cards
- has_many :items

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|number|string|null: false|
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
|item_detail_status|string|null: false|
|delivery_charge_detail|string|null: false|
|delivery_origin|string|null: false|
|delivery_date|string|null: false|
|price|integer|null: false|
|user_id|integer|null: false,foreign_key: true|
|evalution_id|integer|null: false,foreign_key: true|
|item_detail_category_id|integer|null: false,foreign_key: true|
### Association
- belongs_to :user
- belongs_to :evalution
- belongs_to :category
- has_many :items_images

## items_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image_url|string|null: false|
|item_id|integer|null: false,foreign_key: true|
### Association
- belongs_to :item

## evalutionテーブル
|Column|Type|Options|
|------|----|-------|
|good|string||
|normal|string||
|bad|string||
### Association
- belongs_to :item

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|null: false|
### Association
- belongs_to :item