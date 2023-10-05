class TradingAnimalsController < ApplicationController
  def index 
    entry = Entry.where(user_id: current_user.id).pluck(:room_id)
    #この行では、現在ログインしているユーザーが所属する全てのルームのidを取得してentryに代入している
    
    rooms = Room.where(id: entry)
    #この行では、entryに代入されたidを元に、roomsテーブルから当てはまる全てのroomのレコードを取得してroomに代入している

    evaluation = TradingEvaluation.where(room_id: rooms)
    #この行では、roomに代入されたレコードの情報を元に、trading_evaluationsテーブルから当てはまる全てのtrading_evaluationのレコードを取得してevaluationに代入している
    # まず、trading_evaluationsテーブルの中で、"room_id"が一意であるレコードを配列で抽出する
    # unique_room_ids = TradingEvaluation.group(:room_id).having('COUNT(room_id) = 1').pluck(:room_id)
    unique_room_ids = evaluation.group(:room_id).having('COUNT(room_id) = 1').pluck(:room_id)
    # "receive_user_id（評価されたユーザーのid）"が"current_user"と同じで、かつ"room_id"が一意であるレコードを抽出
    # @result = TradingEvaluation.where(receive_user_id: current_user.id, room_id: unique_room_ids)
    result = TradingEvaluation.where(receive_user_id: current_user.id, room_id: unique_room_ids)

    room_result = result.pluck(:room_id)

    animal_ids = Room.where(id:room_result).pluck(:animal_id)

    animals = Animal.where(id:animal_ids)
    # resultに条件を満たすレコードが格納され、このレコードが「取引中のレコード」になる
    
    trading_animal = rooms.pluck(:animal_id)
    trading_now = Animal.where(id:trading_animal, trading_status: 1)

    @all_animals = animals + trading_now
    #binding.pry
  end
end
