# チケットのCRUD
class OpinionsController < AuthenticatedController
  def index
    @opinions = Opinion.where({ project_id: params[:project_id] })
  end
end
