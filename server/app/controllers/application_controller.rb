# 主にエラー処理
class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  # skip_before_action :verify_authenticity_token, if: :devise_controller? # APIではCSRFチェックをしない

  rescue_from Forbidden, with: :rescue403

  def rescue403(e)
    request.format = :json if request.xhr?
    render json: { status: :forbidden }
  end

  rescue_from ActiveRecord::RecordInvalid, with: :rescue422

  def rescue422(e)
    @exception = e.record.errors

    request.format = :json if request.xhr?
    render 'errors/validation_error', status: :unprocessable_entity
  end
end
