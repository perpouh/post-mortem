require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe TicketsController, type: :request do
  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let(:ticket) { create(:ticket) }
  let(:newticket) { attributes_for(:newticket) }
  @auth_tokens = {}
  before do
    user.confirm
    @auth_tokens = sign_in(user)
  end
  describe 'GET #index' do
    it 'returns http success' do
      get project_tickets_path({project_id: project.id}), headers: @auth_tokens
      expect(response).to have_http_status(:success)
    end
  end
  describe 'GET #show' do
    it 'returns http success' do
      get project_ticket_path({project_id: project.id, id: ticket.id}), headers: @auth_tokens
      expect(response).to have_http_status(:success)
    end
  end
  describe 'POST #create' do
    it 'returns http unauthorized' do
      post project_tickets_path(project), params: {ticket: newticket}
      expect(response).to have_http_status(:unauthorized)
    end
    it 'returns http success' do
      post project_tickets_path(project), params: {ticket: newticket}, headers: @auth_tokens
      expect(response).to have_http_status(:success)
    end
    # it 'returns http forbidden' do
    #   # 参加していないプロジェクトに対してチケットを作成することはできない　未実装
    #   post project_tickets_path(project), params: {ticket: newticket}, headers: @auth_tokens
    #   expect(response).to have_http_status(:forbidden)
    # end
    it 'returns http unprocessable_entity' do
      # バリデーションエラー
      params = {
        ticket: {
          body: ""
        }
      }
      post project_tickets_path(project), params: params, headers: @auth_tokens
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
  describe 'GET #update' do
    it 'returns http success' do
      params = {
        ticket: {
          body: "テスト"
        }
      }
      patch project_ticket_path(project, ticket), params: params, headers: @auth_tokens
      expect(response).to have_http_status(:success)
    end
    # it 'returns http forbidden' do
    #   # チケット登録者以外は編集できない 未実装
    #   params = {
    #     ticket: {
    #       body: "テスト"
    #     }
    #   }
    #   patch :update, params: params, headers: @auth_tokens
    #   expect(response).to have_http_status(:forbidden)
    # end
    it 'returns http unprocessable_entity' do
      # バリデーションエラー
      params = {
        ticket: {
          body: ""
        }
      }
      patch project_ticket_path(project, ticket), params: params, headers: @auth_tokens
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
# rubocop:enable Metrics/BlockLength
