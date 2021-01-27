class PresentationsController < ApplicationController
  def index
    @presentations = current_user.presentations.all
  end

  def new
  end
end
