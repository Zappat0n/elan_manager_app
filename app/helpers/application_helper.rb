module ApplicationHelper
  def update_avatar
    current_user.avatar = params[:avatar]
    current_user.sava
  end

  def current_avatar
    unless current_user.avatar.attached?
      current_user.avatar.attach(io: File.open('app/assets/images/Lego-Anna.jpg'), filename: 'Lego-Anna.jpg')
    end
    current_user.avatar
  end
end
