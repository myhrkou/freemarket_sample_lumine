class UserStepsController < ApplicationController
  def register1
    @user = User.new
  end

  def register2
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:yomi_last_name] = user_params[:yomi_last_name]
    session[:yomi_first_name] = user_params[:yomi_first_name]
    birthday = Date.new(user_params["birth_day(1i)"].to_i, user_params["birth_day(2i)"].to_i, user_params["birth_day(3i)"].to_i)
    session[:birth_day] = birthday
    @user = User.new
  end

  def register3
    session[:phone_number] = user_params[:phone_number]
    @user = User.new
    @user.build_address
    @user.last_name = session[:last_name]
    @user.first_name = session[:first_name]
    @user.yomi_last_name = session[:yomi_last_name]
    @user.yomi_first_name = session[:yomi_first_name]
    @user.phone_number = session[:phone_number]
  end

  def register4
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:yomi_last_name] = user_params[:yomi_last_name]
    session[:yomi_first_name] = user_params[:yomi_first_name]
    session[:zip] = user_params[address: [:zip]]
    session[:prefecture] = user_params[address: [:prefecture]]
    session[:city] = user_params[address: [:city]]
    session[:number] = user_params[address: [:number]]
    session[:building] = user_params[address: [:building]]
    session[:address] = user_params[:address_attributes]
    @user = User.new
  end

  def create
    pass = Devise.friendly_token
    if pass.present?
      session[:password] = pass
    end
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name],
      first_name: session[:first_name],
      yomi_last_name: session[:yomi_last_name],
      yomi_first_name: session[:yomi_first_name],
      phone_number: session[:phone_number],
      birth_day: session[:birth_day],
    )
    @user.build_address(
      session[:address]
    )

    if @user.save
      sign_in User.find(@user.id) unless user_signed_in?
    else
      render "user_steps/register4"
    end
    Payjp.api_key = Rails.application.secrets.payjp_private_key
    if params["payjp-token"].blank?
      render "user_steps/register4"
    else
      customer = Payjp::Customer.create(
        description: "test",
        email: @user.email,
        card: params["payjp-token"],
        metadata: { user_id: current_user.id },
      )
      @card = Card.new(
        user_id: current_user.id,
        customer_id: customer.id,
        card_id: customer.default_card,
      )

      if @card.save
        redirect_to done_user_steps_path
      else
        redirect_to register4_user_steps_path
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :first_name,
      :last_name,
      :yomi_first_name,
      :yomi_last_name,
      :phone_number,
      :birth_day,
      address_attributes: [:id, :zip, :prefecture, :city, :number, :building, :user_id],
    )
  end
end
