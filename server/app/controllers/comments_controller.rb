# コメント操作
class CommentsController < ApplicationController
  # コメントはプロジェクトに参加して無くても可能
  # コメントを付けたチケットのウォッチとかやるかは未定
  def create
    Comment.create!(comments_params
      .merge({ project_id: params[:project_id], reference_id: params[:ticket_id], user_id: current_user.id }))
    render json: { status: :ok }
  end

  private

  def comments_params
    params.require(:comment).permit(:body)
  end
end