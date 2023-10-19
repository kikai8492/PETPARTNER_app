class TradingAnimalsController < ApplicationController
  def index 
    entry = Entry.where(user_id: current_user.id).pluck(:room_id)  
    #この行で現在ログインしているユーザーの全てのroom_idを取得している
    rooms = Room.where(id: entry)
    #この行でentryで取得したroom_idを元にroomテーブルから該当のroomを取得している
    evaluation = TradingEvaluation.where(room_id: rooms)    
    #この行でroomsで取得したroom_idを元にtrading_evaluationテーブルから該当のroom_idを持つレコードを取得している
    unique_room_ids = evaluation.group(:room_id).having('COUNT(room_id) = 1').pluck(:room_id)  
    #この行でevaluationで取得したroom_idを元にtrading_evaluationテーブルから同じroom_idがある物を除外し、1つのroom_idのみを取得している
    result = TradingEvaluation.where(receive_user_id: current_user.id, room_id: unique_room_ids)
    #この行でunique_room_idsで取得したroom_idを元にtrading_evaluationテーブルからreceive_user_idが現在ログインしているユーザーの物を取得している
    room_result = result.pluck(:room_id)
    #この行でresultで取得したroom_idを元にtrading_evaluationテーブルからroom_idのみを取得している
    animal_ids = Room.where(id:room_result).pluck(:animal_id)
    #この行でroom_resultで取得したroom_idを元にroomテーブルからanimal_idを取得している
    animals = Animal.where(id:animal_ids)   
    #この行でanimal_idsで取得したanimal_idを元にanimalテーブルからその動物の情報を取得している
    
    #以下の行からは現在取引中の動物を取得している
    trading_animal = rooms.pluck(:animal_id)
    #この行ではroomsで取得したroom_idを元にroomテーブルからanimal_idを取得している
    trading_now = Animal.where(id:trading_animal, trading_status: 1)
    #この行ではtrading_animalで取得したanimal_idを元にanimalテーブルからtrading_statusが1の動物を取得している

    @all_animals = animals + trading_now
    #最後にanimalsとtrading_nowを合わせた物を@all_animalsに代入している
  end
end
