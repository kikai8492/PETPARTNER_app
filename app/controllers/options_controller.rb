class OptionsController < ApplicationController

  def index
    @options = current_user.options.all.order(created_at: :desc)

    answer1_average = @options.average(:answer1)
    answer2_average = @options.average(:answer2)
    answer3_average = @options.average(:answer3)
    answer4_average = @options.average(:answer4)
    answer5_average = @options.average(:answer5)
    answer6_average = @options.average(:answer6)
    answer7_average = @options.average(:answer7)
    answer8_average = @options.average(:answer8)
    answer9_average = @options.average(:answer9)
    answer10_average = @options.average(:answer10)

    @average_score = (answer1_average + answer2_average + answer3_average + answer4_average + answer5_average + answer6_average + answer7_average + answer8_average + answer9_average + answer10_average).round(0) #種数点以下は四捨五入 
  end

  def new
    if user_signed_in?
      @option = Option.new
      # @questions = Question.all
    else
      redirect_to animals_path, notice: "ログインしてください"
    end
  end

  def create
    @option = current_user.options.build(option_params)

    if @option.save
      redirect_to option_path(@option), notice: "結果をご確認ください"
    else
      render :new, alert: "診断に失敗しました"
    end
  end

  def show
    @option = Option.find(params[:id])
    @score = @option.answer1 + @option.answer2 + @option.answer3 + @option.answer4 + @option.answer5 + @option.answer6 + @option.answer7 + @option.answer8 + @option.answer9 + @option.answer10
    
    prompt = <<-EOS
    あなたは捨て猫や捨て犬を保護する保健所の職員です。
    ある日、とある人が引き取りたいと言ってきました。
    引き取りにあたり、事前にテストを受けてもらい、その人が飼い主として適切かどうかを判断するためのテストを受けてもらいました。
    以下は、その人のテストの結果です。
    
    その前にスコアの説明をします。
    その質問に対しての答えが10の場合はよく当てはまる。
    その質問に対しての答えが8の場合はやや当てはまる。
    その質問に対しての答えが5の場合はあまり当てはまらない。
    その質問に対しての答えが3の場合は当てはまらない。

    質問1:あなたは毎日一定の時間、ペットの世話をすることができますか？ 引き取り相手の答え:#{@option.answer1}
    質問2:あなたはペットの世話をするために、毎月一定の金額を費やすことができますか？(犬の場合は1ヶ月約1万円、猫の場合は1ヶ月約5000円)引き取り相手の答え:#{@option.answer2}
    質問3:ペットが病気や怪我をした際、直ちに動物病院に連れて行くなど緊急の対応ができますか？引き取り相手の答え:#{@option.answer3}
    質問4:あなたまたは家族がアレルギーの症状を持っていませんか？引き取り相手の答え:#{@option.answer4}
    質問5:あなたの住んでいる場所でペットを飼うことは許されていますか？引き取り相手の答え:#{@option.answer5}
    質問6:定期的に散歩などの運動やふれあいの時間をペットと共有できますか？引き取り相手の答え:#{@option.answer6}
    質問7:定期的に転勤や引っ越しをする頻度は少なめですか？引き取り相手の答え:#{@option.answer7}
    質問8:長期的なパートナーとして、最後まで世話する覚悟ができていますか？（猫や犬の寿命はおおよそ10年から20年程度です）引き取り相手の答え:#{@option.answer8}
    質問9:犬や猫の特有の行動や性格を学び、理解しようとする意欲がありますか？引き取り相手の答え:#{@option.answer9}
    質問10:必要に応じて、ペットのしつけや訓練を行うことができますか？引き取り相手の答え:#{@option.answer10}

    上記のテストの結果をもとに、飼い主としてのアドバイスを文章の始まりを「あなたは飼い主として」にして、いい点と、改善点を100文字程度でまとめて。

    スコア: #{@score}%
        EOS

      client = OpenAI::Client.new(access_token: ENV['GPT_API'])

      response = client.chat(
          parameters: {
              model: "gpt-3.5-turbo",
              messages: [{ role: "user", content: prompt}],
              temperature: 0.7,
          })

      @feedback = response["choices"][0]["message"]["content"]
  
  end

  private 

  def option_params
    params.require(:option).permit(:answer1, :answer2, :answer3, :answer4, :answer5, :answer6, :answer7, :answer8, :answer9, :answer10)
  end
end
