class CategoriesController < ApplicationController
  before_action :set_category
  before_action :set_ransack

  def category
  end

  def category_root
    @category_ids = Category.find(params[:format]).indirect_ids
    @items=[]
    @category_ids.each do |category_id|
      @item_box=Item.where.not(status: "stop").where(category_id: category_id)
      @item_box.each do |item|
        @items<<item
      end
    end
    @category = @categories[params[:format].to_i - 1]
  end

  def category_child
    @category_ids = Category.find(params[:format]).child_ids
    @items=[]
    @category_ids.each do |category_id|
      @item_box=Item.where.not(status: "stop").where(category_id: category_id)
      @item_box.each do |item|
        @items<<item
      end
    end
    @category = @categories[params[:format].to_i - 1]
  end

  def category_grandchild
    @category_id = Category.where(id: params[:format]).ids.first
    @items = Item.where.not(status: "stop").where(category_id: @category_id)
    @category = @categories[params[:format].to_i - 1]
  end

  private

  def set_category
    @parents = Category.order("id ASC").limit(3)
    @categories = Category.order("id ASC")
  end

  def set_ransack
    @search = Item.ransack(params[:q])
    @items = @search.result.page(params[:page]).per(16)
  end
end
