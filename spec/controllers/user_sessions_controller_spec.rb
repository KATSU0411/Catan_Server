require 'rails_helper'

RSpec.describe UserSessionsController, type: :controller do
  before :each do
    request.headers['CONTENT_TYPE'] = 'application/json'
    FactoryBot.create(:user)
    @user = FactoryBot.attributes_for(:user)
  end
  describe 'UserSessionsController validation' do

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

