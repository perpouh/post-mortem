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
        name: params.name
      })
    end

    def members
      members = @client.get_project_users @project_id
      members.map do |member|
        user = User.find_by(email: member[:mailAddress])
        return user if user.present?
    
        user = User.create({
          email: member[:mailAddress], 
          password: ENV.fetch('DEFAULT_PASSWORD'){ 'password' },
          nickname: member[:name],
          username: member[:userId]
          })
        send_reset_password_instructions({email: email})
    
        return user
      end
    end
  end
end