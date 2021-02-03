module GroupsHelper
  def group_params
    params.require(:group).permit(:name, :user_id, :avatar)
  end

  def group_avatar(group)
    res = group.avatar.attached? ? (image_tag group.avatar.variant(resize_to_limit: [75, 75]), class: 'image') : '<br>'
    res.html_safe
  end
end
