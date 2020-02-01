class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  def index
    @items=Item.all
  end

  def new
    @item = Item.new
    @item.items_images.new
  end

  def create
    @item = Item.new(item_params)


    if @item.save
      # redirect_to root_path
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

  private

  def item_params
    params.require(:item).permit(:name, :description,:condition,:delivery_charge_detail,:delivery_origin,:delivery_date,:price, items_images_attributes: [:item_id,:image_url,:_destroy, :id ]).merge(user_id:1)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end