# ユーザー権限チェック
module Authority
  extend ActiveSupport::Concern

  def admin_user!
    true
  end
end
