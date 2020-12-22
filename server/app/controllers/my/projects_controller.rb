module My
  # ログインユーザーが参加している、もしくはウォッチしているプロジェクトを取得する
  class ProjectsController < AuthenticatedController
    def index
      @projects = Project.joining(current_user.id)
    end
  end
end