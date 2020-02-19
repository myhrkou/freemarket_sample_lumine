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
  belongs_to :card, optional: true
  has_many :sns_credentials
  has_many :comments

  mount_uploader :image, ImageUploader

  ZENKAKU=/\A[ぁ-んァ-ン一-龥]+\z/
  KATAKANA=/\A[ァ-ヶー－]+\z/
  TEL=/\A\d{10,11}\z/
  validates :nickname, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, length: { minimum: 7 }
  validates :first_name, presence: true,format:{with:ZENKAKU}
  validates :last_name, presence: true,format:{with:ZENKAKU}
  validates :yomi_first_name, presence: true,format:{with:KATAKANA}
  validates :yomi_last_name, presence: true,format:{with:KATAKANA}
  validates :birth_day, presence: true
  validates :phone_number, uniqueness: true,format:{with:TEL}
end
