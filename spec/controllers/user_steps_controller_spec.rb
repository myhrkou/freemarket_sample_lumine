require 'rails_helper'

describe UserStepsController do

  describe 'GET #step1' do
    it "renders the :step1 template" do
      get :step1
      expect(response).to render_template :step1
    end
  end

  describe 'GET #done' do
    it "renders the :done template" do
      get :done
      expect(response).to render_template :done
    end
  end
end
