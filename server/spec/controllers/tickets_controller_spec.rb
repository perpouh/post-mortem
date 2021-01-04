require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe TicketsController, type: :request do
  let(:user) { create(:user) }
  let(:newticket) { attributes_for(:newticket) }
  @auth_tokens = {}
  before do
    user.confirm
    @auth_tokens = sign_in(user)
  end
  describe 'GET #index' do
    let(:project) { create(:project, :with_tickets) }

    it 'returns http success' do
      get project_tickets_path(project), headers: @auth_tokens
      expect(response).to have_http_status(:success)
    end

    it 'returns all tickets' do
      get project_tickets_path(project), headers: @auth_tokens
      expect(response.body).to include "チケットA"
      expect(response.body).to include "チケットB"
      expect(response.body).to include "チケットC"
    end
  end

  describe 'GET #show' do
    let(:project) { create(:project, :with_tickets) }

    it 'returns http success' do
      get project_ticket_path(project, project.tickets.first), headers: @auth_tokens
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    let(:project) { create(:project) }

    it 'returns http unauthorized' do
      post project_tickets_path(project), params: {ticket: newticket}
      expect(response).to have_http_status(:unauthorized)
    end

    context 'when signed' do
      before do
        project.members.create({user_id: user.id})
      end
      it 'returns http success' do
        post project_tickets_path(project), params: {ticket: newticket}, headers: @auth_tokens
        expect(response).to have_http_status(:success)
      end

      it 'returns http unprocessable_entity' do
        # バリデーションエラー
        params = {
          ticket: {
            body: "",
            opinion_type: :keep_on
          }
        }
        post project_tickets_path(project), params: params, headers: @auth_tokens
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    it 'returns http forbidden' do
      # 参加していないプロジェクトに対してチケットを作成することはできない
      post project_tickets_path(project), params: {ticket: newticket}, headers: @auth_tokens
      expect(response).to have_http_status(:forbidden)
    end
  end
  describe 'PATCH #update' do
    let(:project) { create(:project, :with_tickets) }

    context 'when owned' do
      before do
        project.members.create({user_id: user.id})
        @ticket = project.tickets.create({user_id: user.id, body: "ほげほげ", opinion_type: :keep_on})
      end
      it 'returns http success' do
        params = {
          ticket: {
            body: "テスト"
          }
        }
        patch project_ticket_path(project, @ticket), params: params, headers: @auth_tokens
        expect(response).to have_http_status(:success)
      end
      it 'returns http unprocessable_entity' do
        # バリデーションエラー
        params = {
          ticket: {
            body: ""
          }
        }
        patch project_ticket_path(project, @ticket), params: params, headers: @auth_tokens
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
    it 'returns http forbidden' do
      # チケット登録者以外は編集できない 未実装
      params = {
        ticket: {
          body: "テスト"
        }
      }
      patch project_ticket_path(project, project.tickets.first), params: params, headers: @auth_tokens
      expect(response).to have_http_status(:forbidden)
    end
  end
end
# rubocop:enable Metrics/BlockLength
