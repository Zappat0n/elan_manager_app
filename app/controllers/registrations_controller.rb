class RegistrationsController < ApplicationController
  include RegistrationsHelper

  def update
    current_user.avatar.attach(params[:avatar])
    if current_user.avatar.attached?
      redirect_to root_path, notice: 'Avatar updated'
    else
      redirect_to root_path, alert: 'Error updating avatar'
    end
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
