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

  def acceptable_image
    return unless avatar.attached?

    unless avatar.byte_size <= 1.megabyte
      errors.add(:avatar, "is too big")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(avatar.content_type)
      errors.add(:avatar, "must be a JPEG or PNG")
    end
  end
end
