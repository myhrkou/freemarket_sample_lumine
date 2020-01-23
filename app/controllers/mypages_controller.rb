class MypagesController < ApplicationController
  def mypage
    @card = Card.where(user_id: current_user.id).first
  end
  def mypagelogout
  end
  def card
  end
end
