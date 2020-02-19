class Voucher < ApplicationRecord
  has_many :used_voucher_users
  validates :name, presence: true
  validates :code, presence: true
end
