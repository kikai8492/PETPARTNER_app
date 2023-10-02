class CheckerShowController < ApplicationController
  def show
    @option = Option.find(params[:id])
    @score = @option.answer1 + @option.answer2 + @option.answer3 + @option.answer4 + @option.answer5 + @option.answer6 + @option.answer7 + @option.answer8 + @option.answer9 + @option.answer10
  end
end
