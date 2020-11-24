class MembersController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user.present?
      project = Project.find(params[:project_id])
      project.members.create({user_id: user.id})
    else
      # 招待
    end
  end

  private

end
