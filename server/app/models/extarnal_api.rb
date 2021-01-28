class ExtarnalApi
  def self.generate_connector(url)
    uri = URI.parse(url)
    case uri.host
    when /backlog.com$/
      return Extarnal::Backlog.new(uri.path)
    else
      raise ActiveRecord::RecordInvalid.new(self.new)
    end
  end
end