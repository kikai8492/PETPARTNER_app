class TradingAnimalsController < ApplicationController
  def index 
    entry = Entry.where(user_id: current_user.id).pluck(:room_id)    
    rooms = Room.where(id: entry)
    evaluation = TradingEvaluation.where(room_id: rooms)    
    unique_room_ids = evaluation.group(:room_id).having('COUNT(room_id) = 1').pluck(:room_id)   
    result = TradingEvaluation.where(receive_user_id: current_user.id, room_id: unique_room_ids)
    room_result = result.pluck(:room_id)
    animal_ids = Room.where(id:room_result).pluck(:animal_id)
    animals = Animal.where(id:animal_ids)   
    
    trading_animal = rooms.pluck(:animal_id)
    trading_now = Animal.where(id:trading_animal, trading_status: 1)

    @all_animals = animals + trading_now
  end
end
