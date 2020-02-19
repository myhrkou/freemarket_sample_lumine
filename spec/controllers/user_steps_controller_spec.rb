require "rails_helper"

describe UserStepsController do
  describe "GET #register1" do
    it "renders the :register1 template" do
      get :register1
      expect(response).to render_template :register1
    end
  end

  describe "GET #register2" do
    it "renders the :register2 template" do
      get :register2, params: { user: {
        nickname: "abebuu" ,
        email: "ggg@gmail.com",
        password: "00000000" ,
        password_confirmation: "00000000" ,
        first_name: "ひろし" ,
        last_name: "佐藤" ,
        yomi_first_name: "ヒロシ" ,
        yomi_last_name: "サトウ" ,
        "birth_day(1i)": "1996",
        "birth_day(2i)": "5",
        "birth_day(3i)": "30",
        phone_number: "00011112222"
      } }
      expect(response).to be_successful
    end
  end

  describe "GET #register3" do
    it "renders the :register3 template" do
      user_params = attributes_for(:user)
      get :register3, params: { user: user_params }
      expect(response).to be_successful
    end
  end

  describe "GET #register4" do
    it "renders the :register4 template" do
      user_params = attributes_for(:user)
      get :register4, params: { user: user_params }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "200 response" do
      user_params = attributes_for(:user)
      address_params = attributes_for(:address)
      session[:nickname] = user_params[:nickname]
      session[:email] = user_params[:email]
      session[:password] = user_params[:password]
      session[:last_name] = user_params[:last_name]
      session[:first_name] = user_params[:first_name]
      session[:yomi_last_name] = user_params[:yomi_last_name]
      session[:yomi_first_name] = user_params[:yomi_first_name]
      session[:birth_day] = user_params[:birth_day]
      session[:phone_number] = user_params[:phone_number]
      session[:zip] = user_params[address: [:zip]]
      session[:prefecture] = address_params[:prefecture_id]
      session[:city] = address_params[:city]
      session[:number] = address_params[:number]
      session[:building] = address_params[:building]
      session[:address] = user_params[:address_attributes]
      post :create, params: { user: user_params }
      expect(response).to have_http_status "200"
    end
  end

  describe "POST #create" do
    it "save user" do
      user_params = attributes_for(:user)
      address_params = attributes_for(:address)
      session[:nickname] = user_params[:nickname]
      session[:email] = user_params[:email]
      session[:password] = user_params[:password]
      session[:last_name] = user_params[:last_name]
      session[:first_name] = user_params[:first_name]
      session[:yomi_last_name] = user_params[:yomi_last_name]
      session[:yomi_first_name] = user_params[:yomi_first_name]
      session[:birth_day] = user_params[:birth_day]
      session[:phone_number] = user_params[:phone_number]
      session[:zip] = user_params[address: [:zip]]
      session[:prefecture] = address_params[:prefecture_id]
      session[:city] = address_params[:city]
      session[:number] = address_params[:number]
      session[:building] = address_params[:building]
      session[:address] = user_params[:address_attributes]
      post :create, params: { user: user_params }
      change { User.count }.by(1)
      expect(response).to be_successful
    end
  end

  describe "GET #done" do
    it "renders the :done template" do
      get :done
      expect(response).to render_template :done
    end
  end
end
