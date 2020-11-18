class CommentsController < ApplicationController
  def create
    @ticket = Ticket.find(params[:ticket_id])
    @ticket.comments.create({body:params[:body], user_id: current_user.id})
  end
end
