class StaticPagesController < ApplicationController
  def index
    if current_user
      @title = current_user.name.upcase
      render 'static_pages/user_show'
    else
      @title = 'ELAN MONTESSORI'
      render 'static_pages/index'
    end
  end
end
