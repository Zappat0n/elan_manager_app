module GroupsHelper
  def group_params
    params.require(:group).permit(:name, :user_id, :avatar)
  end
end
