# URLを判定して外部API接続モジュールを返却する
class ExtarnalApi
  def self.generate_connector(url)
    uri = URI.parse(url)
    case uri.host
    when /backlog.com$/
      Extarnal::Backlog.new(uri.path)
    else
      raise ActiveRecord::RecordInvalid '利用できないURLです。'
    end
  end
end