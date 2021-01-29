class StaticPagesController < ApplicationController
  def index
    @title = current_user ? current_user.name.upcase : 'ELAN MONTESSORI'
  end
end
