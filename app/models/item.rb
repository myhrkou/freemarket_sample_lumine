class Item < ApplicationRecord
  belongs_to :user, optional: true 
  has_many :items_images,dependent: :destroy
  validates :name, :description, :condition, :delivery_charge_detail, :delivery_origin, :delivery_date, :price,presence: true
  accepts_nested_attributes_for :items_images, allow_destroy: true
  enum status:{
    exhibition: 0, #出品
    trans: 1, #取引中
    stop: 2, #停止
    complete: 3 #売却済み
  }
end
