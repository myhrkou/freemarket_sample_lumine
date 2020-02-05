class CategoryController < ApplicationController
  before_action :set_category

  def category

  end
  
  def category0
    @items = Item.where(category0_id: params[:format]).order(id: "DESC").page(params[:page]).per(15)
  end

  def category1
    @items = Item.where(category1_id: params[:format]).order(id: "DESC").page(params[:page]).per(15)
  end

  def category2
    @items = Item.where(category2_id: params[:format]).order(id: "DESC").page(params[:page]).per(15)
  end

  private

  def set_category
    @category0s = Category0.all
    @category1s = Category1.all
    @category2s = Category2.all
  end
end
