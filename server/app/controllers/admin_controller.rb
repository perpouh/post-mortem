# 管理者権限
class AdminController < AuthenticatedController
  before_action :admin_user!
end