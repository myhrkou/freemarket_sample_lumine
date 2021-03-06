class CardsController < ApplicationController
  require "payjp"
  before_action :set_card,only: %i[new delete show]
  before_action :set_category
  before_action :set_ransack,except:[:pay]

  def new
  end

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = Rails.application.secrets.payjp_private_key
    if params['payjp-token'].blank?
      redirect_to card_mypages_path
    else
      customer = Payjp::Customer.create(
      description: '登録テスト', #なくてもOK
      email: current_user.email, #なくてもOK
      card: params['payjp-token'],
      metadata: { user_id: current_user.id }
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to card_path(@card.id)
      else
        redirect_to pay_cards_path
      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    if @card.blank?
      redirect_to card_mypages_path
    else
      Payjp.api_key = Rails.application.secrets.payjp_private_key
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
    end
      redirect_to card_mypages_path
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    if @card.blank?
      redirect_to card_mypages_path
    else
      Payjp.api_key = Rails.application.secrets.payjp_private_key
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  private

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_category
    @parents = Category.order("id ASC").limit(3)
  end

  def set_ransack
    @search = Item.ransack(params[:q])
    @items = @search.result.page(params[:page]).per(16)
  end
end

