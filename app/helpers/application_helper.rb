module ApplicationHelper
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email avatar])
    devise_parameter_sanitizer.permit(:edit, keys: %i[name email avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email avatar])
  end

  def current_avatar
    unless current_user.avatar.attached?
      current_user.avatar.attach(io: File.open('app/assets/images/Lego-Anna.jpg'), filename: 'Lego-Anna.jpg')
    end
    current_user.avatar
  end
end
