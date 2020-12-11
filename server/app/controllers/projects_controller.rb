class ProjectsController < AuthenticatedController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)

    render json: {status: :ok, message: "プロジェクトを作成しました", created: @project.id}
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
  end

  def update

  end

  def destroy
  end

  private
    def project_params
      params.require(:project).permit(:name, :repository_url, :backlog_url, :jira_url, :confluence_url)
    end
end
