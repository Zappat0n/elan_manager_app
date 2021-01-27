class RegistrationsController < ApplicationController
  include RegistrationsHelper

  def new; end

  def update
    if current_user.avatar.attach(params['/users'][:avatar])
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
