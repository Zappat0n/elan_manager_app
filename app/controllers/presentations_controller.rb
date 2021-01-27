class PresentationsController < ApplicationController
  def index
    unless params[:external]
      @presentations = current_user.presentations.all
    else
      @presentations = current_user.external_presentations.all
    end
  end

  def new
  end
end
