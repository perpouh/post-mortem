require 'backlog_kit'
module Extarnal
  # BacklogAPI接続用モジュール
  # BacklogAPIへの接続、データの取得、それぞれのモデルに合わせたデータの成形
  class Backlog
    @project_id = ''
    @client = nil

    def initialize(path)
      @project_id = path.split('/').compact.reject(&:empty?)[1]
      raise ActiveRecord::RecordInvalid, 'BacklogプロジェクトのURLを正しく指定してください。' unless @project_id.match?(/\A[0-9A-Z_]+\z/)

      @client = BacklogKit::Client.new(
        space_id: ENV.fetch('BACKLOG_SPACE_ID'),
        api_key: ENV.fetch('BACKLOG_API_KEY')
      )
    end

    def project
      params = @client.get_project @project_id
      Project.new({
        name: params.body.name,
        backlog_url: "https://#{ENV.fetch('BACKLOG_SPACE_ID')}.backlog.com/projects/#{@project_id}"
      })
    end

    def members
      members = @client.get_project_users @project_id
      members.body.map do |member|
        user = User.find_by(email: member.mailAddress)
        next user if user.present?

        next parse_user member
      end
    end

    private

    def parse_user(backlog_user)
      user = User.create({
        email: backlog_user.mailAddress,
        password: ENV.fetch('DEFAULT_PASSWORD') { 'password' },
        nickname: backlog_user.name,
        username: backlog_user.name
      })
      user.confirm
      user.send_reset_password_instructions
      user
    end
  end
end