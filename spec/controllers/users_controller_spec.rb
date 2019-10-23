require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before :each do
    @user = FactoryBot.attributes_for(:user)
  end

  describe 'UsersController validation' do

    context 'get show' do
      it 'return 200 status' do
        login(request)
        resp = get :show, params:{
          id: User.first.id,
        }
        expect(resp).to have_http_status(:ok)
      end
    end

    context 'post create' do
      it 'return 201 status correct parameters' do
        resp = post :create, params: @user
        expect(resp).to have_http_status(:created)
      end

      it 'return 400 status bad parameters' do
        @user[:name] = ''
        resp = post :create, params: @user
        expect(resp).to have_http_status(:bad_request)
      end
    end
  end
end
