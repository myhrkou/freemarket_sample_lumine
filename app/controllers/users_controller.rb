class UsersController < ApplicationController
  def index
  end
  def edit
  end
  def update
    if current_user.update!(user_params)
      render :edit
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(address_attributes: [:id, :zip, :prefecture, :city, :number, :building, :user_id],
    )
  end
end