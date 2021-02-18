module My
  class ProfileController < AuthenticatedController
    def show
      @user = current_user

      render json: {username: @user.username, nickname: @user.nickname}
    end
  end
end