require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe ProjectsController, type: :request do
  let(:user) { create(:user) }
  @auth_tokens = {}
  before do
    user.confirm
    Rails.logger.info '作成されたユーザー'
    Rails.logger.info user.to_json
    @auth_tokens = sign_in(user)
    Rails.logger.info @auth_tokens
  end
  describe 'GET #index' do
    it 'returns http success' do
      get projects_path, headers: @auth_tokens
      expect(response).to have_http_status(:success)
    end
  end
  describe 'GET #show' do
    it 'returns http success' do
      get project_path, params: {id: 1}, headers: auth_tokens
      expect(response).to have_http_status(:success)
    end
  end
  describe 'POST #create' do
    it 'returns http success' do
      post projects_path, headers: auth_tokens
      expect(response).to have_http_status(:success)
    end
  end
  describe 'PATCH #update' do
    it 'returns http success' do
      patch project_path, params: {id: 1}, headers: auth_tokens
      expect(response).to have_http_status(:success)
    end
  end
  describe 'DELETE #destroy' do
    it 'returns http success' do
      delete project_path, params: {id: 1}, headers: auth_tokens
      expect(response).to have_http_status(:success)
    end
  end
end
# rubocop:enable Metrics/BlockLength
