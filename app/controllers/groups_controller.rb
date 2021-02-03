class GroupsController < ApplicationController
  include GroupsHelper

  before_action :authenticate_user!

  def index
    @groups = current_user.groups.includes(avatar_attachment: :blob)
    @title = 'GROUPS'
  end

  def new
    @title = 'NEW GROUP'
    @group = current_user.groups.build
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      redirect_to groups_path, notice: 'Group saved.'
    else
      redirect_to new_group_path, alert: @group.errors.first.full_message
    end
  end

  def show
    @group = Group.includes(presentations: :author).find(params[:id])
    @title = @group.name.upcase
  end
end
