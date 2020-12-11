class ApplicationController < ActionController::API
  # include DeviseTokenAuth::Concerns::SetUserByToken
  rescue_from ActiveRecord::RecordInvalid, with: :rescue422

  def rescue422(e)
    @exception = e.record.errors

    request.format = :json if request.xhr?
    render 'errors/validation_error', status: :unprocessable_entity
  end
end
