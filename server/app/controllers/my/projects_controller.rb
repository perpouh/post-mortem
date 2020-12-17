class My::ProjectsController < AuthenticatedController
  def index
    @projects = Project.joining(current_user.id)
  end
end