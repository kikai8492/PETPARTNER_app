class RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    # @animal = Animal.find(params[:animal_id])


    @room = Room.create
    @animal = @room.animal
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
    # redirect_to "/rooms/#{@room.id}"
    redirect_to room_path(@room.id)
  end

  def show
    # @animal = Animal.find(params[:id])
    # binding.pry
    # @user = @animal.user
    @room = Room.find(params[:id])
    @animal = @room.animal
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.chats
      @message = Chat.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
