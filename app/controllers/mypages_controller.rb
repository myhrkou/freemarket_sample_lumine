class MypagesController < ApplicationController
  before_action :set_card

  def mypage
  end

  def mypagelogout
  end

  def card
  end

  def exhibition
    @exhibitions=Item.where(status: :exhibition).order(id: "DESC").page(params[:page]).per(10)
  end

  def trans
    @transes=Item.where(status: :trans).order(id: "DESC").page(params[:page]).per(10)
  end

  def complete
    @completes=Item.where(status: :complete).order(id: "DESC").page(params[:page]).per(10)
  end

  private

  def set_card
    @card = Card.where(user_id: current_user.id).first
  end
end
