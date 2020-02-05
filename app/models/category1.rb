class Category1 < ApplicationRecord
  belongs_to :category0
  has_many :category2s
  has_many :items
end
