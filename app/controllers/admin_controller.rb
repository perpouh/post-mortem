class AdminController < AuthenticatedController
  before_action :admin_user!
end