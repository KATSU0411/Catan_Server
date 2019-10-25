require 'rails_helper'

RSpec.describe UserSessionsController, type: :controller do
  before :each do
    request.headers['CONTENT_TYPE'] = 'application/json'
  end

  describe 'UserSessionsController validation' do

    context 'post create' do
      before :each do
        FactoryBot.create(:user)
        @user = FactoryBot.attributes_for(:user)
      end

      it 'return 200 status correct parameters' do
        resp = post :create, params: @user
        expect(resp).to have_http_status(:ok)
      end

      it 'return 400 status bad parameters' do
        @user[:name] = ''
        resp = post :create, params: @user
        expect(resp).to have_http_status(:bad_request)
      end
    end

    context 'delete destroy' do
      it 'return 200 status correct parameters' do
        login(request)
        resp = delete :destroy
        expect(resp).to have_http_status(:ok)
      end
    end
  end
end

