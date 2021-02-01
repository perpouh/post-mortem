module My
  # 自分の参加しているもしくはウォッチしているプロジェクトのチケットを取得する
  class TicketsController < AuthenticatedController
    def newer
      @tickets = Ticket.in_joining_project(current_user).tickets_only.page(params[:page] || 1).per(20)
      render 'tickets/index', status: :ok
    end

    def active
      @tickets = Ticket.in_joining_project(current_user).tickets_only.active.page(params[:page] || 1).per(20)
      render 'tickets/index', status: :ok
    end

    def mentioned
      @opinions = Opinion.mentioned(current_user).page(params[:page] || 1).per(20)
      render 'search/index', status: :ok
    end
  end
end