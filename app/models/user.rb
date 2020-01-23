class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
      email: auth.info.email,
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end

  has_one :address
  accepts_nested_attributes_for :address
  belongs_to :card
  has_many :sns_credentials

  validates :nickname, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, length: { minimum: 7 }
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :yomi_first_name, presence: true
  validates :yomi_last_name, presence: true
  validates :birth_day, presence: true
  validates :phone_number, uniqueness: true
end
