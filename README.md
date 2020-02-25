# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|yomi_first_name|string|null: false|
|yomi_last_name|string|null: false|
|birth_day|date|null: false|
|phone_number|string||
|image|string||
|content|string||
|point|integer||
### Association
- belongs_to :card
- has_many :items
- has_one :address
- has_many :comments
- has_many :used_voucher_users

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|zip|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|number|string|null: false|
|building|string||
|user_id|integer|null: false,foreign_key: true|
### Association
- belongs_to :user

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|customer_id|string|null: false|
|card_id|string|null: false|
|user_id|string|null: false,foreign_key: true|
### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|condition|string|null: false|
|delivery_charge_detail|string|null: false|
|delivery_origin|string|null: false|
|delivery_date|string|null: false|
|price|integer|null: false|
|user_id|integer|null: false,foreign_key: true|
|category_id|integer|null: false,foreign_key: true|
### Association
- belongs_to :user
- belongs_to :category
- has_many :items_images
- has_many :comments

## items_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image_url|string|null: false|
|item_id|integer|null: false,foreign_key: true|
### Association
- belongs_to :item

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|ancestory|
### Association
- has_many :items

## vouchersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
|code|string||
|price|integer||
### Association
- has_many :used_voucher_users

## used_voucher_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false,foreign_key: true|
|voucher_id|integer|null: false,foreign_key: true|
### Association
- belongs_to :user
- belongs_to :voucher

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|string|null:false|
|user_id|integer|null: false,foreign_key: true|
|item_id|integer|null: false,foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user