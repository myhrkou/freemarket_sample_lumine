class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create,:all]
  before_action :authenticate_user!,only: [:new]

  def index
    @items=Item.all.limit(15).order(id:'DESC')
  end

  def new
    @item = Item.new
    @item.items_images.new
  end

  def create
    @item = Item.new(item_params)
    @item.price_yen
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

  def all
    @items = Item.all.order(id:'DESC').page(params[:page]).per(15)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description,:condition,:delivery_charge_detail,:delivery_origin,:delivery_date,:price, items_images_attributes: [:image_url,:_destroy, :id]).merge(user_id:current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end