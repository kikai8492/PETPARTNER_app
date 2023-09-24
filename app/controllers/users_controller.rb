class UsersController < ApplicationController

  def index
    @animals = current_user.animals
  end
  
  def show
    # @user = User.find(params[:id])
  end
end
