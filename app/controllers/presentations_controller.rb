class PresentationsController < ApplicationController
  include PresentationsHelper

  def index
    if params[:external]
      @presentations = current_user.external_presentations.includes(:group)
      @title = 'EXTERNAL PRESENTATIONS'
    else
      @presentations = current_user.presentations.includes(:group)
      @title = 'PRESENTATIONS'
    end
  end

  def new
    @title = 'NEW PRESENTATION'
    @presentation = current_user.presentations.build
  end

  def create
    # TODO : Redirect with params to see if external or not
    presentation = current_user.presentations.build(presentation_params)
    if presentation.save
      redirect_to presentations_path, notice: 'Presentation saved'
    else
      redirect_to new_presentation_path, alert: 'Error saving presentation'
    end
  end
end
