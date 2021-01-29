module PresentationsHelper
  def presentation_params
    params.require(:presentation).permit(:name, :group_id, :author_id, :amount)
  end
end
