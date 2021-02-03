class PresentationsController < ApplicationController
  include PresentationsHelper

  before_action :authenticate_user!

  def index
    if params[:external]
      @presentations = current_user.presentations.external_presentations.includes(groups: { avatar_attachment: :blob })
      @title = 'EXTERNAL PRESENTATIONS'
    else
      @presentations = current_user.presentations.grouped_presentations.includes(groups: { avatar_attachment: :blob })
      @title = 'PRESENTATIONS'
    end
  end

  def new
    @title = 'NEW PRESENTATION'
    @presentation = current_user.presentations.build
  end

  def create
    presentation = current_user.presentations.build
    presentation.name = presentation_params[:name]
    presentation.amount = presentation_params[:amount]
    if presentation_params[:groups]
      group = Group.find(presentation_params[:groups])
      presentation.groups << group
    end

    if presentation.save
      redirect_to presentations_path, notice: 'Presentation saved.'
    else
      redirect_to new_presentation_path, alert: 'Error saving presentation.'
    end
  end
end
