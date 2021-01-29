require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe ProjectsController, type: :request do
  let(:user) { create(:user) }
  let(:project) { create(:project) }
  @auth_tokens = {}
  before do
    user.confirm
    @auth_tokens = sign_in(user)
  end
  describe 'GET #index' do
    it 'returns http success' do
      get projects_path, headers: @auth_tokens
      expect(response).to have_http_status(:success)
    end
  end
  describe 'GET #show' do
    it 'returns http success' do
      get project_path(project), headers: @auth_tokens
      expect(response).to have_http_status(:success)
    end
  end
  describe 'POST #create' do
    it 'returns http success' do
      post projects_path, headers: @auth_tokens, params: { project: attributes_for(:project) }
      expect(response).to have_http_status(:success)
    end
  end
  describe 'GET #read' do
    it 'returns http success' do
      post project_read_path, headers: @auth_tokens, params: { url: "https://perpoor.backlog.com/projects/TEST_PROJECT_1" }
      expect(response).to have_http_status(:success)
    end
  end
  describe 'PATCH #update' do
    it 'returns http success' do
      patch project_path(project), params: { project: { name: 'タイトル更新' } }, headers: @auth_tokens
      expect(response).to have_http_status(:success)
    end
  end
  describe 'DELETE #destroy' do
    it 'returns http success' do
      delete project_path(project), headers: @auth_tokens
      expect(response).to have_http_status(:success)
    end
  end
end
# rubocop:enable Metrics/BlockLength
