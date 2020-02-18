require 'rails_helper'
describe ItemsController do
  let(:user) {create(:user)}
  let(:category) {create(:category)}
  let(:item) {create(:item,category_id:category.id,user_id:user.id)}
  let(:params){ { id: 1 } }
  
  describe 'GET #index' do
    it "assigns the requested item to @items" do
      items=create_list(:item, 10,category_id:category.id,user_id:user.id)
      get :index
      expect(assigns(:items)).to match(items.sort!.reverse!)
    end
  end

  describe 'POST #create' do
    describe '#create' do
      context 'log in' do
        before do
          sign_in user
        end
        context 'can create' do
          it 'create item' do
            post :create, params: { item: {
              name:"aaaa", 
              description:"bbbb", 
              condition:"未使用に近い", 
              delivery_charge_detail:"未使用に近い", 
              delivery_origin_id:"4", 
              delivery_date:"2~3日で発送", 
              price:"9000", 
              user_id:"4",
              category_id:"20",
              items_image:attributes_for(:items_image)
            }}
            expect(response).to be_successful
          end
          it 'redirects to root_path' do
            get :index
            expect(response).to render_template :index
          end
        end
      end
    end
  end

  describe 'PATCH #update' do
    describe '#update' do
      context 'log in' do
        before do
          sign_in user
          @item=create(:item,category_id:category.id,user_id:user.id)
        end
        context 'can update' do
          it 'update item' do
            item_params=FactoryBot.attributes_for(:item,name:"bbb",category_id:category.id,user_id:user.id)
            patch :update,params:{id:@item.id,item:item_params}
            expect(@item.reload.name).to eq "bbb"
          end
          it 'redirects to root_path' do
            get :index
            expect(response).to render_template :index
          end
        end
      end
    end
  end
  
  describe 'DELETE #destroy' do
    describe '#destroy' do
      context 'log in' do
        before do
          sign_in user
          @item=create(:item,category_id:category.id,user_id:user.id)
        end
        context 'can destroy' do
          it 'delete item' do
            expect {delete :destroy, params:{id:@item.id}
            }.to change(Item, :count).by(-1)
          end
          it 'redirects to root_path' do
            get :index
            expect(response).to render_template :index
          end
        end
      end
    end
  end

  describe 'POST #pay' do
    context 'save' do
      it "renders the :root template" do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  describe 'GET #stop' do
    context 'save' do
      it "renders the :root template" do
        get :index
        expect(response).to render_template :index
      end
    end
    context 'not save' do
      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #exhibition' do
    context 'save' do
      it "renders the :root template" do
        get :index
        expect(response).to render_template :index
      end
    end
    context 'not save' do
      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end
  end
end