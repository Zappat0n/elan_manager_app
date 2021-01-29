class RegistrationsController < ApplicationController
  include RegistrationsHelper

  def new; end

  def update
    current_user.name = params[:user][:name] if params[:user][:name]
    current_user.avatar.attach(params[:user][:avatar]) unless current_user.avatar == params[:user][:avatar]

    if current_user.save
      redirect_to root_path, notice: 'Avatar updated'
    else
      debugger
      redirect_to users_edit_path
    end
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
