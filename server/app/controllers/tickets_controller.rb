# チケットのCRUD
class TicketsController < AuthenticatedController
  include TagExtractor

  before_action :joining, only: [:create]
  before_action :owner, only: [:update]

  def index
    @tickets = Ticket.where({ project_id: params[:project_id] })
  end

  def show
    @project = Project.find_by(params[:project_id])
    @ticket = Ticket.find(params[:id])
  end

  def create
    @ticket = @project.tickets.create!(ticket_params.merge({ user_id: current_user.id }))

    extract_tags(ticket_params[:body]).each do |tag|
      Tag.find_or_create_by(body: tag)
    end

    render json: { status: :ok, message: 'チケットを作成しました', created: @ticket.id }
  end

  def update
    @ticket.update!(ticket_params)

    extract_tags(ticket_params[:body]).each do |tag|
      Tag.find_or_create_by(body: tag)
    end

    render json: { status: :ok, message: 'チケットを更新しました', created: @ticket.id }
  end

  private

  def ticket_params
    params.require(:ticket).permit(:body, :opinion_type)
  end

  def joining
    @project = Project.where(id: params[:project_id]).joining(current_user)

    # 参画していないプロジェクトにはチケット作れない処理
    raise Forbidden.new if @project.blank?
  end

  def owner
    @ticket = Ticket.where(id: params[:id]).created_by(current_user)

    # 自分が作ったチケット以外は修正できない
    raise Forbidden.new if @ticket.blank?
  end
end
