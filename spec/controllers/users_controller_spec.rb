require 'rails_helper'

describe UsersController do

  describe 'GET #new' do
    it "renders the :index template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before do
      @user = create(:user)
      sign_in @user
    end
    it "renders the :edit template" do
      get :edit,params:{id:@user.id}
      expect(response).to render_template :edit
    end
  end

  describe 'GET #profile' do
    before do
      @user = create(:user)
      sign_in @user
    end
    it "renders the :profile template" do
      get :profile,params:{id:@user.id}
      expect(response).to render_template :profile
    end
  end

  describe 'UPDATE #edit' do
    before do
      @user = create(:user)
      sign_in @user
    end
    it "update user" do
      user_params = FactoryBot.attributes_for(:user, phone_number: "0000000000")
      patch :update,params:{id:@user.id,user:user_params}
      expect(@user.reload.phone_number).to eq "0000000000"
    end
  end
end