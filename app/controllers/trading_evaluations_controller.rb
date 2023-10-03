class TradingEvaluationsController < ApplicationController
  def index
    @trading_evaluations = current_user.trading_evaluations.receive_user_id.all.order(created_at: :desc)
    @trading_partner = Room.entries.where.not(user_id: current_user.id).first.user_id
  end
  
  def new
    @trading_evaluation = TradingEvaluation.new
    @room = Room.find(params[:room_id])
    @animal = Animal.find(@room.animal_id)

    # binding.pry
    trading_partner_id = @room.entries.where.not(user_id: current_user.id).first.user_id
    @trading_partner = User.find(trading_partner_id)
  end

  def create
    room = Room.find(params[:trading_evaluation][:room_id])
    @trading_evaluation = room.trading_evaluations.build(trading_evaluation_params)

    if @trading_evaluation.save
      @animal = Animal.find(room.animal_id)
      @animal.update(trading_status: 2)
      redirect_to animals_path, notice: "取引相手を評価しました。以上で取引終了です。またのご利用をお待ちしております"
    else
      render :new, alert: "取引評価に失敗しました"
    end
  end

  def show
    @trading_evaluation = TradingEvaluation.find(params[:id])
  end

  private

  def trading_evaluation_params
    params.require(:trading_evaluation).permit(:feedback, :score, :user_id, :receive_user_id, :get_animal, :room_id)
  end
end
