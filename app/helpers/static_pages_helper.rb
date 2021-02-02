module StaticPagesHelper
  def navbar_dropdown_items
    result = []
    if current_user
      result << (link_to 'Main page', root_path, class: 'dropdown-item')
      result << (link_to 'Sign out', users_sign_out_path, method: :delete, class: 'dropdown-item')
    else
      result << (link_to 'Sign in', users_sign_in_path, class: 'dropdown-item')
      result << (link_to 'Sign up', users_sign_up_path, class: 'dropdown-item')
    end
    result
  end
end
