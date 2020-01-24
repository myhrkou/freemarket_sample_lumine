class UsersController < ApplicationController
before_action :set_card,only: [:profile,:edit]

  def index
  end
  def profile
  end
  def edit
  end
  def update
    if current_user.update!(user_params)
      render template:"mypages/mypage"
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :first_name,
      :last_name,
      :yomi_first_name,
      :yomi_last_name,
      :phone_number,
      :birth_day,
      :content,
      address_attributes: [:id, :zip, :prefecture, :city, :number, :building, :user_id],
    )
  end

  def set_card
    @card=Card.where(user_id:current_user.id)
  end
end