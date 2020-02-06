class CategoriesController < ApplicationController
  before_action :set_category

  def category
  end

  def category_root
    @category_ids = Category.find(params[:format]).indirect_ids
    @items=@category_ids.map{|category_id| Item.find_by(category_id: category_id)}
  end

  def category_child
    @category_ids = Category.find(params[:format]).child_ids
    @items=@category_ids.map{|category_id| Item.find_by(category_id: category_id)}
  end

  def category_grandchild
    @category_id = Category.where(id: params[:format]).ids.first
    @items = Item.where(category_id: @category_id)
  end

  private

  def set_category
    @parents = Category.order("id ASC").limit(3)
  end
end