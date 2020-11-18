class TicketsController < ApplicationController
  def index
  end

  def show
    @project = Project.find_by(params[:project_id])
    @ticket = Ticket.find(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    @ticket = @project.tickets.build
  end

  def create
    #　TODO: 参画していないプロジェクトにはチケット作れない処理
    @project = Project.find(params[:project_id])
    @project.tickets.create(ticket_params)
  end

  def edit
    @project = Project.find_by(params[:project_id])
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    @ticket.update(ticket_params)
  end

  private
  def ticket_params
    params.require(:ticket).permit(:body)
  end
end
