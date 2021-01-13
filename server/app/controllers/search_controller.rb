# 検索
class SearchController < AuthenticatedController
  def index
    return if params[:q].blank? && params[:tag].blank?

    @opinions = search_condition.result.page(params[:page] || 1).per(20)
  end

  private

  def search_query
    {
      'body_matches_all' => params[:q][:body_matches_all].split(/\p{blank}/).map { |t| "%#{t}%" },
      'opinion_type_in' => params[:q][:opinion_type_in]
    }
  end

  def search_condition
    if params[:q].present?
      Opinion.ransack(search_query)
    elsif params[:tag].present?
      Opinion.ransack({ body_matches: "%##{params[:tag]}%" })
    end
  end
end