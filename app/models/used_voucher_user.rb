class UsedVoucherUser < ApplicationRecord
  belongs_to :voucher
  validates :voucher_id, presence: true
  validates :user_id, presence: true
end
