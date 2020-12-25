module My
  # 自分の参加しているもしくはウォッチしているプロジェクトのチケットを取得する
  class TicketsController < AuthenticatedController
    def newer
      Ticket.with_joining_project.page(params[:page] || 1).per(20)
    end

    def active
      Ticket.with_joining_project.active.page(params[:page] || 1).per(20)
    end

    def mentioned
      Ticket.with_joining_project.mentioned.page(params[:page] || 1).per(20)
    end
  end
end