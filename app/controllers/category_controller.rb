class CategoryController < ApplicationController
  before_action :set_category

  def category
  end

  def category0
    @category_ids = Category.find(params[:format]).indirect_ids
    @items = []
    @category_ids.each do |category_id|
      @items << Item.find_by(category_id: category_id)
    end
  end

  def category1
    @category_ids = Category.find(params[:format]).child_ids
    @items = []
    @category_ids.each do |category_id|
      @items << Item.find_by(category_id: category_id)
    end
  end

  def category2
    @category_id = Category.where(id: params[:format]).ids.first
    @items = Item.where(category_id: @category_id)
  end

  private

  def set_category
    @parents = Category.all.order("id ASC").limit(3)
  end
end
