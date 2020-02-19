class MypagesController < ApplicationController
  before_action :set_card
  before_action :set_category
  before_action :set_ransack

  def mypage
    @items = Item.where(user_id: current_user.id)
  end

  def mypagelogout
  end

  def card
  end

  def exhibition
    @exhibitions = Item.where(status: [:exhibition,:stop]).where(user_id: current_user.id).order(id: "DESC").page(params[:page]).per(10)
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

  def voucher
    @used_vouchers = UsedVoucherUser.where(user_id: current_user)
    @used_vouchers_mat = @used_vouchers.map { |record| record.voucher_id }
    @vouchers = Voucher.where.not(id: @used_vouchers_mat)
  end

  private

  def set_card
    @card = Card.where(user_id: current_user.id).first
  end

  def set_category
    @parents = Category.order("id ASC").limit(3)
  end

  def set_ransack
    @search = Item.ransack(params[:q])
    @items = @search.result.page(params[:page]).per(16)
  end
end
