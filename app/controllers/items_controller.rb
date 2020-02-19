class ItemsController < ApplicationController
  before_action :set_item, only: [:update, :show, :destroy, :edit]
  before_action :authenticate_user!, only: [:new, :show]
  before_action :set_card, only: [:pay_comfirm, :pay]
  before_action :set_category, except: [:create, :update, :destroy, :pay, :pay_comfirm]
  before_action :set_ransack, only: [:index, :show, :edit, :all, :search]

  def index
    @items = Item.where.not(status: "stop").limit(15).order(id: "DESC")
    @voucher = Voucher.find(1)
  end

  def new
    @item = Item.new
    @item.items_images.new
    respond_to do |format|
      format.html
      format.json do
        @children = Category.find(params[:parent_id]).children
      end
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      respond_to do |format|
        format.html { render :new }
        format.json
      end
    else
      set_category
      set_ransack
      render :new
    end
  end

  def edit
    @child_id = Category.find(@item.category_id).parent_id
    @children = Category.find(@item.category_id).parent.siblings
    @grand_children = Category.find(@item.category_id).siblings
    respond_to do |format|
      format.html
      format.json do
        @children = Category.find(params[:parent_id]).children
      end
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
    if @item.buyer.present?
      @buyer = User.find(@item.buyer)
    end
    if @item.voucher_id.present?
      @voucher = Voucher.find(@item.voucher_id)
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to item_path
    end
  end

  def all
    @items = Item.where.not(status: "stop").order(id: "DESC").page(params[:page]).per(15)
  end

  def pay_comfirm
    @item = Item.find(params[:id])
    Payjp.api_key = Rails.application.secrets.payjp_private_key
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
    @used_vouchers = UsedVoucherUser.where(user_id: current_user)
    @used_vouchers_mat = @used_vouchers.map { |record| record.voucher_id }
    @vouchers = Voucher.where.not(id: @used_vouchers_mat)
    session[:item] = @item
    @id = 0
    respond_to do |format|
      format.html
      format.json do
        @voucher = Voucher.find(1)
        @item = Item.find(params[:id])
        if (params[:flag] != nil)
          @id = params[:flag]
        end
      end
    end
  end

  def pay
    @item = session[:item]
    id = @item["id"].to_s
    @item = Item.find(id)
    if (params[:id] != nil)
      @voucher = Voucher.find(params[:id])
      voucher_price = @voucher.price
      @item.voucher_id = @voucher.id
    else
      voucher_price = 0
    end
    amount = @item["price"].to_i - voucher_price
    if amount < 50
      amount = 50
    end
    Payjp.api_key = Rails.application.secrets.payjp_private_key
    Payjp::Charge.create(
      amount: amount,
      customer: @card.customer_id,
      currency: "jpy",
    )
    if (params[:id] != nil)
      @used_voucher_user = UsedVoucherUser.new(voucher_id: @voucher.id, user_id: current_user.id)
      @used_voucher_user.save
    end
    @item.complete!
    @item.buyer = current_user.id
    @item.updated_at = Time.now
    if @item.save
      redirect_to root_path
    else
      redirect_to pay_comfirm_items_path
    end
  end

  def stop
    @item = Item.find(params[:format])
    @item.status = "stop"
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def exhibition
    @item = Item.find(params[:format])
    @item.status = "exhibition"
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def search
    respond_to do |format|
      format.html
      format.json do
        @children = Category.find(params[:parent_id]).children
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :condition, :delivery_charge_detail, :delivery_origin_id, :delivery_date, :price, :category_id, items_images_attributes: [:item_id, :image_url, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_category
    @parents = Category.order("id ASC").limit(3)
  end

  def set_ransack
    if (params[:q] != nil && params[:q][:category_id_in] != nil)
      params[:q][:category_id_in] = params[:q][:category_id_in].to_i
      if (params[:q][:category_id_in].between?(1, 3))
        @parent_id = params[:q][:category_id_in].to_i
      elsif (params[:q][:category_id_in].between?(4, 9))
        @parent_id = Category.find(params[:q][:category_id_in]).parent_id
        @child_id = params[:q][:category_id_in]
        @children = Category.find(@child_id).siblings
      elsif (params[:q][:category_id_in].between?(10, 30))
        @parent_id = Category.find(params[:q][:category_id_in]).root_id
        @child_id = Category.find(params[:q][:category_id_in]).parent_id
        @grand_child_id = params[:q][:category_id_in]
        @children = Category.find(@child_id).siblings
        @grand_children = Category.find(@grand_child_id).siblings
      end
    end
    if params[:q] != nil
      params[:q][:category_id_in] = Item.select_category(params[:q])
      if params[:q][:name_cont_any] != nil
        @keyword = params[:q][:name_cont_any]
        params[:q][:name_cont_any] = params[:q][:name_cont_any].split(/[\p{blank}\s]+/)
      end
    end
    @search = Item.ransack(params[:q])
    @items = @search.result.where.not(status: "stop").page(params[:page]).per(16)
  end
end
