module ApplicationHelper
  def update_avatar
    current_user.avatar = params[:avatar]
    current_user.sava
  end
end
