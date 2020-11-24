class CommentsController < ApplicationController
  def create
    Comment.create!(comments_params.merge({project_id: params[:project_id], reference_id: params[:ticket_id], user_id: current_user.id}))
    render :json => {status: :ok}
  end

  private
  def comments_params
    params.permit(:body)
  end
end
