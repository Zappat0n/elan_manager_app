class PresentationsController < ApplicationController
  include PresentationsHelper

  def index
    @presentations = if params[:external]
                       current_user.external_presentations.all
                     else
                       current_user.presentations.all
                     end
  end

  def new
    @presentation = current_user.presentations.build
  end

  def create
    presentation = current_user.presentations.build(presentation_params)
    if presentation.save
      redirect_to presentations_index_path, notice: 'Presentation saved'
    else
      redirect_to presentations_index_path, alert: 'Error saving presentation'
    end
  end
end
