# Backlogから情報を吸い出してメンバー一覧を登録したりする
class MembersController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user.present?
      project = Project.find(params[:project_id])
      project.members.create({ user_id: user.id })
    else
      # TODO: 後で考える
      User.new(email: params[:email])
    end
  end
end
