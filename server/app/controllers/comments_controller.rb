class CommentsController < ApplicationController
  def create
    Comment.create!(comments_params.merge({project_id: params[:project_id], reference_id: params[:ticket_id], user_id: 1}))
    render :json => {status: :ok}
  end

  private
  def comments_params
    params.require(:comment).permit(:body)
  end
end
