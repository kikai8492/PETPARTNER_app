class TradingPartnerChecksController < ApplicationController
  def show
    @user = User.find(params[:id])

    @user_options = Option.where(user_id: params[:id])
    @user_options = @user.options.recent
    answer1_average = @user_options.answer1_avg
    answer2_average = @user_options.answer2_avg
    answer3_average = @user_options.answer3_avg
    answer4_average = @user_options.answer4_avg
    answer5_average = @user_options.answer5_avg
    answer6_average = @user_options.answer6_avg
    answer7_average = @user_options.answer7_avg
    answer8_average = @user_options.answer8_avg
    answer9_average = @user_options.answer9_avg
    answer10_average = @user_options.answer10_avg

    @average_score = (answer1_average + answer2_average + answer3_average + answer4_average + answer5_average + answer6_average + answer7_average + answer8_average + answer9_average + answer10_average).round(0) #種数点以下は四捨五入 
  end
end
