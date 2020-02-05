class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :show,:create, :all, :pay_comfirm, :pay]
  before_action :authenticate_user!, only: [:new,:show]
  before_action :set_card, only: [:pay_comfirm, :pay]
  before_action :set_category,except:[:new,:create,:update,:destroy,:pay,:pay_comfirm]

  def index
    @items = Item.all.limit(15).order(id: "DESC")
  end

  def new
    @item = Item.new
    @item.items_images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    session[:item] = @item
    @prefecture = Prefecture.find(@item.delivery_origin).name
    @user = User.find(@item.user_id).nickname

  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to item_path
    end
  end

  def all
    @items = Item.all.order(id: "DESC").page(params[:page]).per(15)
  end

  def pay_comfirm
    @item = session[:item]
    @item = Item.find(@item["id"])
    Payjp.api_key = Rails.application.secrets.payjp_private_key
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
  end

  def pay
    @item = session[:item]
    Payjp.api_key = Rails.application.secrets.payjp_private_key
    Payjp::Charge.create(
      amount: @item["price"].to_i,
      customer: @card.customer_id,
      currency: "jpy",
    )
    id = @item["id"].to_s
    @item = Item.find(id)
    @item.complete!
    @item.buyer = current_user.id
    if @item.save
      redirect_to root_path
    else
      redirect_to pay_comfirm_items_path
    end
  end



  private

  def item_params
    params.require(:item).permit(:name, :description, :condition, :delivery_charge_detail, :delivery_origin, :delivery_date, :price, items_images_attributes: [:item_id,:image_url,:_destroy, :id ]).merge(user_id:current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_category
    @category0s=Category0.all
    @category1s=Category1.all
    @category2s=Category2.all
  end
end
