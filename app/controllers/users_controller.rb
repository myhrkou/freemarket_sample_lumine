class UsersController < ApplicationController
  before_action :set_card, only: [:profile, :edit, :update]
  before_action :set_category
  before_action :set_ransack

  def index
  end

  def profile
    @items = Item.where(user_id: current_user.id)
  end

  def edit
  end

  def update
    @items = Item.where(user_id: current_user.id)
    if current_user.update!(user_params)
      render template: "mypages/mypage"
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
      :image,
      address_attributes: [:id, :zip, :prefecture, :city, :number, :building, :user_id],
    )
  end

  def set_card
    @card = Card.where(user_id: current_user.id)
  end

  def set_category
    @parents = Category.order("id ASC").limit(3)
  end

  def set_ransack
    @search = Item.ransack(params[:q])
    @items = @search.result.page(params[:page]).per(16)
  end
end
