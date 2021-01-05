module My
  # 自分の参加しているもしくはウォッチしているプロジェクトのチケットを取得する
  class TicketsController < AuthenticatedController
    def newer
      @tickets = Ticket.in_joining_project(current_user).tickets_only.page(params[:page] || 1).per(20)
    end

    def active
      @tickets = Ticket.in_joining_project(current_user).tickets_only.active.page(params[:page] || 1).per(20)
      render json: @tickets, status: :ok
    end

    def mentioned
      @opinions = Opinion.mentioned(current_user).page(params[:page] || 1).per(20)
      render json: @opinions, status: :ok
    end
  end
end