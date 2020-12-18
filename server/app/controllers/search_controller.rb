class SearchController < AuthenticatedController
  def index
    if params[:q].blank? && params[:tag].blank?
      return;
    end

    if params[:q].present?
      @title = "#{params[:q][:body_matches_any]}の検索結果"
      condition = Opinion.ransack(search_query)
    elsif params[:tag].present?
      @title = "#{params[:tag]}の検索結果"
      condition = Opinion.ransack({body_matches: "%##{params[:tag]}%"})
    end
    @opinions = condition.result.page(params[:page] || 1).per(20)
  end

  private
    def search_query
      return {
        "body_matches_any" => params[:q][:body_matches_any].split(/[\p{blank}]/).map{|t| "%#{t}%"},
        "opinion_type_in" => params[:q][:opinion_type_in]
      }
    end
end