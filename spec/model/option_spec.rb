require "rails_helper"
RSpec.describe 'optionモデル機能', type: :model do
  context '飼い主チェッカーの質問1が空白の場合' do
    it 'バリデーションにひっかる' do
      option = Option.new(answer1:[] ,answer2:10,answer3:10,answer4:10,answer5:10,answer6:10,answer7:10,answer8:10,answer9:10,answer10:10)
      expect(option).not_to be_valid
    end
  end

  context '飼い主チェッカーの質問2が空白の場合' do
    it 'バリデーションにひっかる' do
      option = Option.new(answer1:10 ,answer2:[],answer3:10,answer4:10,answer5:10,answer6:10,answer7:10,answer8:10,answer9:10,answer10:10)
      expect(option).not_to be_valid
    end
  end

  context '飼い主チェッカーの質問3が空白の場合' do
    it 'バリデーションにひっかる' do
      option = Option.new(answer1:10 ,answer2:10,answer3:[],answer4:10,answer5:10,answer6:10,answer7:10,answer8:10,answer9:10,answer10:10)
      expect(option).not_to be_valid
    end
  end

  context '飼い主チェッカーの質問4が空白の場合' do
    it 'バリデーションにひっかる' do
      option = Option.new(answer1:10 ,answer2:10,answer3:10,answer4:4,answer5:10,answer6:10,answer7:10,answer8:10,answer9:10,answer10:10)
      expect(option).not_to be_valid
    end
  end

  context '飼い主チェッカーの質問5が空白の場合' do
    it 'バリデーションにひっかる' do
      option = Option.new(answer1:10 ,answer2:10,answer3:10,answer4:10,answer5:[],answer6:10,answer7:10,answer8:10,answer9:10,answer10:10)
      expect(option).not_to be_valid
    end
  end
end