class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    Project.create(project_params)

    redirect_to projects_path
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
