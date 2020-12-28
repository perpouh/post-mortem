class Forbidden < ActionController::ActionControllerError
  def http_status
    403
  end
end