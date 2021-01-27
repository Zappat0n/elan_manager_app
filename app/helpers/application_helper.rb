module ApplicationHelper
  def update_avatar
    current_user.avatar = params[:avatar]
    current_user.sava
  end

  def current_avatar
    unless current_user.avatar.attached?
      image = open('https://allears.net/wp-content/uploads/2019/03/Lego-Anna.jpg')
      current_user.avatar.attach(io: image, filename: 'Lego-Anna.jpg')
    end
    current_user.avatar
  end
end
