class RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    @room = Room.create
    @animal = @room.animal
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to room_path(@room.id)
  end

  def show
    @room = Room.find(params[:id])
    @animal = @room.animal
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.chats
      @chat = Chat.new
      @entries = @room.entries
    else
      redirect_to animals_path, notice: "他人のチャットルームには入れません"
    end
  end


  def suggest_meeting_place
    @room = Room.find(params[:id])
    @user1 = current_user
    @user2 = @room.entries.where.not(user_id: current_user.id).first.user

    result = MapsService.get_midpoint_on_route(@user1, @user2, ENV['Map_API'])
    midpoint = result[:midpoint]
    total_distance = result[:distance]

    if total_distance / 2 > @user1.actual_movable_distance || total_distance / 2 > @user2.actual_movable_distance
      @alert = "距離が取引可能範囲を超えています。大丈夫ですか？"
      @confirm = true
    else
      place = MapsService.find_nearby_places(midpoint, "convenience_store", ENV['Map_API']) || MapsService.find_nearby_places(midpoint, "park", ENV['Map_API'])
      if place
        @map_url = "https://www.google.com/maps?q=#{place[:latitude]},#{place[:longitude]}"
      else
        @alert = "近くの場所が見つかりませんでした。飼い主に相談してください。"
      end
    end


    Rails.logger.info "User1: #{@user1.inspect}"
    Rails.logger.info "User2: #{@user2.inspect}"
    Rails.logger.info "Map_API: #{Map_API.inspect}"

    # result = MapsService.get_midpoint_on_route(@user1, @user2, ENV['Map_API'])
    Rails.logger.info "Result from midpoint: #{result.inspect}"


    respond_to do |format|
      if @map_url
        format.json { render json: { map_url: @map_url } }
      else
        format.json { render json: { error: "URLを取得できませんでした。" }, status: 400 }
      end
    end
  end


  def self.get_midpoint_on_route(user1, user2, api_key)
    # Calculate the midpoint based on user1 and user2 locations
    # ...
  
    # Return the calculated midpoint and distance (or other details you need)
    {
      midpoint: { latitude: midpoint_lat, longitude: midpoint_lon },
      distance: calculated_distance
    }
  end

end
