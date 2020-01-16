class Address < ApplicationRecord
  belongs_to :user,optional: true
  
  validates :zip,presence:true
  validates :prefecture,presence:true
  validates :city,presence:true
  validates :number,presence:true
end
