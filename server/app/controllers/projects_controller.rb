# プロジェクト操作。主に管理者権限？後で考える
class ProjectsController < AuthenticatedController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create!(project_params.merge({ manager_id: current_user.id }))

    render json: { status: :ok, message: 'プロジェクトを作成しました', created: @project.id }
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:name, :repository_url, :backlog_url, :jira_url, :confluence_url)
  end
end
