class MypagesController < ApplicationController
  before_action :set_card

  def mypage
  end

  def mypagelogout
  end

  def card
  end

  private

  def set_card
    @card = Card.where(user_id: current_user.id).first
  end
end
