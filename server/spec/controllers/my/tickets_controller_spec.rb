require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe My::TicketsController, type: :request do
  let(:user) { create(:user) }
  @auth_tokens = {}
  before do
    user.confirm
    @auth_tokens = sign_in(user)
  end
  describe 'GET #newer' do
    let(:project_a) { create(:project_a, :with_tickets) }
    let(:project_b) { create(:project_b, :with_tickets) }

    before do
      project_a.members.create({user_id: user.id})
    end

    it 'returns http unauthorized' do
      get my_tickets_newer_path
      expect(response).to have_http_status(:unauthorized)
    end
    it 'returns http succeed' do
      get my_tickets_newer_path, headers: @auth_tokens
      expect(response).to have_http_status(:success)
    end

    it '参加しているプロジェクトのチケットが表示されること' do
      get my_tickets_active_path, headers: @auth_tokens
      Rails.logger.info '目印'
      Rails.logger.debug JSON.parse(response.body)
      expect(JSON.parse(response.body)["tickets"].map { |v| v['project_id'] }.uniq.include? project_a.id).to be true
    end

    it '参加していないプロジェクトのチケットが表示されないこと' do
      get my_tickets_active_path, headers: @auth_tokens
      expect(JSON.parse(response.body)["tickets"].map{ |v| v['project_id'] }.uniq.include? project_b.id).to be false
    end

    # it 'チケットの作成日時でソートされること' do

    # end
  end
  describe 'GET #active' do
    let(:project_a) { create(:project_a, :with_tickets) }
    let(:project_b) { create(:project_b, :with_tickets) }

    before do
      project_a.members.create({user_id: user.id})
    end

    it 'returns http unauthorized' do
      get my_tickets_active_path
      expect(response).to have_http_status(:unauthorized)
    end
    it 'returns http succeed' do
      get my_tickets_active_path, headers: @auth_tokens
      expect(response).to have_http_status(:success)
    end

    it '参加しているプロジェクトのチケットが表示されること' do
      get my_tickets_active_path, headers: @auth_tokens
      expect(JSON.parse(response.body)["tickets"].map{ |v| v['project_id'] }.uniq.include? project_a.id).to be true
    end

    it '参加していないプロジェクトのチケットが表示されないこと' do
      get my_tickets_active_path, headers: @auth_tokens
      expect(JSON.parse(response.body)["tickets"].map{ |v| v['project_id'] }.uniq.include? project_b.id).to be false
    end

    # it 'チケットの更新日時でソートされること' do

    # end
  end
  describe 'GET #mentioned' do
    let(:project_a) { create(:project_a, :with_tickets) }
    let(:project_b) { create(:project_b, :with_tickets) }

    it 'returns http unauthorized' do
      get my_tickets_mentioned_path
      expect(response).to have_http_status(:unauthorized)
    end
    it 'returns http succeed' do
      get my_tickets_mentioned_path, headers: @auth_tokens
      expect(response).to have_http_status(:success)
    end

    context '参加しているプロジェクトの' do
      before do
        project_a.members.create({user_id: user.id})
      end
      it 'メンションされているチケットだけが表示されること' do
        get my_tickets_mentioned_path, headers: @auth_tokens
        # 書き方が気に食わない
        expect(JSON.parse(response.body)["opinions"].map{ |v| v["body"] }.all?{ |v| v.include? '@username' }).to be true
      end
    end

    context '参加していないプロジェクトの' do
      it 'メンションされているチケットだけが表示されること' do
        get my_tickets_mentioned_path, headers: @auth_tokens
        # 書き方が気に食わない
        expect(JSON.parse(response.body)["opinions"].map{ |v| v["body"] }.all?{ |v| v.include? '@username' }).to be true
      end
    end

    # it 'チケットの更新日時でソートされること' do

    # end
  end
end
# rubocop:enable Metrics/BlockLength
