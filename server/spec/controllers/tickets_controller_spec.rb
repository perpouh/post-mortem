require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe TicketsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  describe 'GET #show' do
    it 'returns http success' do
      get :show
      expect(response).to have_http_status(:success)
    end
  end
  describe 'GET #create' do
    it 'returns http unauthorized' do
      # 未ログイン
      params = {
        ticket: {
          body: "テスト"
        }
      }
      post :create, params: params
      expect(response).to have_http_status(:unauthorized)
    end
    it 'returns http success' do
      params = {
        ticket: {
          body: "テスト"
        }
      }
      post :create, params: params
      expect(response).to have_http_status(:success)
    end
    it 'returns http forbidden' do
      # 参加していないプロジェクトに対してチケットを作成することはできない
      params = {
        ticket: {
          body: "テスト"
        }
      }
      post :create, params: params
      expect(response).to have_http_status(:forbidden)
    end
    it 'returns http unprocessable_entity' do
      # バリデーションエラー
      params = {
        ticket: {
          body: "テスト"
        }
      }
      post :create, params: params
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
  describe 'GET #update' do
    it 'returns http success' do
      patch :update
      expect(response).to have_http_status(:success)
    end
    it 'returns http forbidden' do
      # チケット登録者以外は編集できない
      params = {
        ticket: {
          body: "テスト"
        }
      }
      patch :update, params: params
      expect(response).to have_http_status(:forbidden)
    end
    it 'returns http unprocessable_entity' do
      # バリデーションエラー
      params = {
        ticket: {
          body: "テスト"
        }
      }
      patch :update, params: params
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
# rubocop:enable Metrics/BlockLength
