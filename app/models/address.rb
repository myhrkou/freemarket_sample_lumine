class Address < ApplicationRecord
  belongs_to :user,optional: true

  ZIP=/\A\d{3}[-]\d{4}\z/

  
  validates :zip,presence:true,format:{with:ZIP}
  validates :prefecture,presence:true
  validates :city,presence:true
  validates :number,presence:true
end
