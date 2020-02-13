class Item < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category
  has_many :items_images, dependent: :destroy
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :condition, :delivery_charge_detail, :delivery_date, :price, presence: true
  validates :delivery_origin, presence: true
  validates :price, numericality: { greater_than: 299, less_than: 10000000 }
  validates :category_id, presence: true, numericality: { greater_than: 9, less_than: 31 }
  accepts_nested_attributes_for :items_images, allow_destroy: true
  enum status: {
    exhibition: 0, #出品
    trans: 1, #取引中
    stop: 2, #停止
    complete: 3, #売却済み
  }
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_origin

  def self.select_category(q)
    int_mat = q[:category_id_in].to_i
    if int_mat.between?(1,3)
      mat = Category.find(q[:category_id_in]).indirect_ids
      mat = mat.map(&:to_s)
      return mat
    elsif int_mat.between?(4,9)
      mat = Category.find(q[:category_id_in]).child_ids
      mat = mat.map(&:to_s)
      return mat
    else
      return q[:category_id_in]
    end
  end
end
