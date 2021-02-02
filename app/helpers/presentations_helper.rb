module PresentationsHelper
  def presentation_params
    params.require(:presentation).permit(:name, :groups, :author_id, :amount)
  end

  def icon_or_name(presentation)
    return unless presentation.groups.first

    if presentation.groups.first.avatar.attached?
      image_tag presentation.groups.first.avatar.variant(resize_to_limit: [75, 75])
    else
      presentation.groups.first.name
    end
  end
end
