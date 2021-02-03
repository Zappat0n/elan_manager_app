class RegistrationsController < ApplicationController
  include RegistrationsHelper

  before_action :authenticate_user!

  def new; end

  def update
    current_user.name = params[:user][:name] if params[:user][:name]
    current_user.avatar.attach(params[:user][:avatar]) unless current_user.avatar == params[:user][:avatar]

    if current_user.save
      redirect_to root_path, notice: 'Avatar updated.'
    else
      redirect_to edit_user_path, alert: current_user.errors.first.full_message
    end
  end
end
