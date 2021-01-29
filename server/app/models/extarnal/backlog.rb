require 'backlog_kit'
module Extarnal
  class Backlog
    @project_id = ""
    @client = nil

    def initialize(path)
      @project_id = path.split('/').compact.reject(&:empty?)[1]
      raise ActiveRecord::RecordInvalid.new(self.new) unless @project_id.match?(/\A[0-9A-Z_]+\z/)

      @client = BacklogKit::Client.new(
        space_id: ENV.fetch('BACKLOG_SPACE_ID'),
        api_key: ENV.fetch('BACKLOG_API_KEY')
      )

      return self
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
    
        user = User.create({
          email: member.mailAddress, 
          password: ENV.fetch('DEFAULT_PASSWORD'){ 'password' },
          nickname: member.name,
          username: member.name
          })
        user.confirm
        user.send_reset_password_instructions
    
        next user
      end
    end
  end
end