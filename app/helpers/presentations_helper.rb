module PresentationsHelper
  def presentation_params
    params.require(:presentation).permit(:name, :group_id, :author_id, :amount)
  end

  def icon_or_name(presentation)
    return unless presentation.group

    if presentation.group.avatar.attached?
      image_tag presentation.group.avatar.variant(resize_to_limit: [75, 75])
    else
      presentation.group.name
    end
  end
end
