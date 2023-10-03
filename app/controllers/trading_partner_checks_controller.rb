class TradingPartnerChecksController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @user_options = Option.where(user_id: params[:id])
    @user_options = @user.options.all.order("created_at DESC")
    
    answer1_average = @user_options.average(:answer1)
    answer2_average = @user_options.average(:answer2)
    answer3_average = @user_options.average(:answer3)
    answer4_average = @user_options.average(:answer4)
    answer5_average = @user_options.average(:answer5)
    answer6_average = @user_options.average(:answer6)
    answer7_average = @user_options.average(:answer7)
    answer8_average = @user_options.average(:answer8)
    answer9_average = @user_options.average(:answer9)
    answer10_average = @user_options.average(:answer10)

    @average_score = (answer1_average + answer2_average + answer3_average + answer4_average + answer5_average + answer6_average + answer7_average + answer8_average + answer9_average + answer10_average).round(0) #種数点以下は四捨五入 
  end
end
