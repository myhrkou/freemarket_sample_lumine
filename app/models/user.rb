class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_one :address
         has_many :cards
         accepts_nested_attributes_for :address
  validates :nickname, presence: true,uniqueness: true
  validates :email,presence:true,uniqueness:true,length:{minimum:7}
  validates :password,presence:true
  validates :first_name,presence:true
  validates :last_name,presence:true
  validates :yomi_first_name,presence:true
  validates :yomi_last_name,presence:true
  validates :birth_day,presence:true
  validates :phone_number,uniqueness:true
end
