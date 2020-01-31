class MypagesController < ApplicationController
  before_action :set_card

  def mypage
    @items = Item.where(user_id: current_user.id)
  end

  def mypagelogout
  end

  def card
  end

  def exhibition
    @exhibitions = Item.where(status: :exhibition).where(user_id: current_user.id).order(id: "DESC").page(params[:page]).per(10)
  end

  def trans
    @transes = Item.where(status: :trans).where(user_id: current_user.id).order(id: "DESC").page(params[:page]).per(10)
  end

  def complete
    @completes = Item.where(status: :complete).where(user_id: current_user.id).order(id: "DESC").page(params[:page]).per(10)
  end

  def negotiate
    # 「コメント入力した商品」に変更
    @negotiate_items=Item.where(status: :trans).where(buyer: current_user.id).order(id: "DESC").page(params[:page]).per(10)
  end

  def purchased
    @bought_items = Item.where(buyer: current_user.id).order(id: "DESC").page(params[:page]).per(10)
  end

  private

  def set_card
    @card = Card.where(user_id: current_user.id).first
  end
end
