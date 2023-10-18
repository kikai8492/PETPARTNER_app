require "rails_helper"
RSpec.describe 'animalモデル機能', type: :model do
  context '動物の写真が空の場合' do
    it 'バリデーションにひっかる' do
      animal = Animal.new(pet_type:"猫",pet_name:"ミー",sex:"オス",age:"0~3ヶ月",vaccinated:"済み",spayed_neutered:"済み",note:"よろしく",prefecture:"東京都")
      expect(animal).not_to be_valid
    end
  end
end