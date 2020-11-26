class TicketsController < ApplicationController
  include TagExtractor

  def index
    @tickets = Ticket.where({project_id: params[:project_id]})
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

    extract_tags(ticket_params[:body]).each do |tag|
      Tag.find_or_create_by(body: tag)
    end
  end

  def edit
    @project = Project.find_by(params[:project_id])
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    @ticket.update(ticket_params)

    extract_tags(ticket_params[:body]).each do |tag|
      Tag.find_or_create_by(body: tag)
    end
  end

  private
  def ticket_params
    params.require(:ticket).permit(:body, :opinion_type)
  end
end
