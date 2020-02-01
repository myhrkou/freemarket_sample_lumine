class Item < ApplicationRecord
  belongs_to :user, optional: true 

  has_many :items_images,dependent: :destroy
  validates :name, presence: true,length: {maximum: 40}
  validates :description, presence: true,length: {maximum: 1000}
  validates :condition, :delivery_charge_detail, :delivery_date, :price,presence: true
  validates :delivery_origin,inclusion: { in: (1..47),message: "を入力してください"}

  validates :price,inclusion: { in: (300..9999999),message: "300~9999999の値を入力してください"}
  accepts_nested_attributes_for :items_images, allow_destroy: true

  enum status:{
    exhibition: 0, #出品
    trans: 1, #取引中
    stop: 2, #停止
    complete: 3 #売却済み
  }
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture


  


end
