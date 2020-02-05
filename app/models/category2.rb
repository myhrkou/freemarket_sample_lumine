class Category2 < ApplicationRecord
  belongs_to :category1
  has_many :items
end
