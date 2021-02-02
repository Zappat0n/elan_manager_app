module PresentationsHelper
  def presentation_params
    params.require(:presentation).permit(:name, :group_id, :author_id, :amount)
  end

  def icon_or_name(presentation)
    return unless presentation.group

    if presentation.group.avatar.attached?
      # <div class="image">
      image_tag presentation.group.avatar.variant(resize_to_limit: [75,75])
      # </div>
    else
      # <div class = "my-title ml-5">
      presentation.group.name
      # </div>
    end
  end
end
