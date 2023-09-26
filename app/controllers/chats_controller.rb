class ChatsController < ApplicationController
  before_action :authenticate_user!

  def create
    if Entry.where(user_id: current_user.id, room_id: params[:chat][:room_id]).present?
      @chat = Chat.create(chat_params.merge(user_id: current_user.id))
    else
      flash[:alert] = "メッセージ送信に失敗しました"
    end
    redirect_to "/rooms/#{@chat.room_id}"
  end

  private

  def chat_params
    params.require(:chat).permit(:message, :image, :room_id)
  end
end
