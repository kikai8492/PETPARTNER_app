class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  # def index
  #   @animals = current_user.animals
  # end
  
  # def show
  #   # @user = User.find(params[:id])
  # end
end
