require 'rails_helper'

RSpec.describe RoomsController, type: :controller do
  before :each do
    request.headers['CONTENT_TYPE'] = 'application/json'
  end

  describe 'RoomsController validation' do
    context 'get index' do
      it 'return 401 status without login' do
        resp = get :index
        expect(resp).to have_http_status(:unauthorized)
      end

      it 'return 200 status with login' do
        login(request)
        resp = get :index
        expect(resp).to have_http_status(:ok)
      end
    end

    context 'get show' do
      it 'return 401 status without login' do
        resp = get :show, params: {
          id: Room.first.id
        }
        expect(resp).to have_http_status(:unauthorized)
      end

      it 'return 200 status with login' do
        login(request)
        resp = get :show, params: {
          id: Room.first.id
        }
        expect(resp).to have_http_status(:ok)
      end
    end

    context 'post create' do
      it 'return 401 status without login' do
        resp = post :create
        expect(resp).to have_http_status(:unauthorized)
      end

      it 'return 400 status with invalidation' do
        login(request)
        resp = post :create
        expect(resp).to have_http_status(:bad_request)
      end

      it 'return 200 status with correct param' do
        login(request)
        resp = post :create, params: {
          name: 'Test1'
        }
        expect(resp).to have_http_status(:ok)
      end
    end
  end
end
