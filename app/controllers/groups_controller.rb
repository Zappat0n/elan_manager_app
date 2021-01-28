class GroupsController < ApplicationController
  include GroupsHelper

  def index
    @groups = current_user.groups.all
    @title = 'GROUPS'
  end

  def new
    @group = current_user.groups.build
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      redirect_to groups_index_path, notice: 'Group saved'
    else
      redirect_to groups_index_path, alert: 'Error saving group'
    end
  end

  def show
    @group = Group.find(params[:id])
    @title = @group.name.upcase
  end
end
