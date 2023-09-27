class ChatsController < ApplicationController
  before_action :authenticate_user!

  def create
    if Entry.where(user_id: current_user.id, room_id: params[:chat][:room_id]).present?
      @chat = Chat.new(chat_params.merge(user_id: current_user.id))
      if @chat.save
        redirect_to room_path(@chat.room_id)
      else
        @room = Room.find(params[:chat][:room_id])
        @messages = @room.chats
        @animal = @room.animal
        @entries = @room.entries
        render "rooms/show"
      end
    else
      redirect_to animals_path, alart: "チャットルームが存在しません"
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:message, :image, :room_id)
  end
end
