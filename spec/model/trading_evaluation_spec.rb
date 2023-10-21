require "rails_helper"
RSpec.describe 'trading_evaluationモデル機能', type: :model do
  context "受け取ったかチェックを入れていない場合" do
    it "バリデーションにひっかる" do
      trading_evaluation = TradingEvaluation.new(
        feedback:"hogehoge",
        score: "良かった",
        get_animal:""
      )
    end
  end

  context "良かったか悪かったかを選択していない場合" do
    it "バリデーションにひっかる" do
      trading_evaluation = TradingEvaluation.new(
        feedback:"hogehoge",
        score: "",
        get_animal:"受け取った"
      )
    end
  end

  context "取引の感想を入力していない場合" do
    it "バリデーションにひっかる" do
      trading_evaluation = TradingEvaluation.new(
        feedback:"",
        score: "良かった",
        get_animal:"受け取った"
      )
    end
  end
end