class AuthenticatedController < ActionController::API
  before_action :authenticate_user!
end