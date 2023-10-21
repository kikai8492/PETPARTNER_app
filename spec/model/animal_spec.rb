require "rails_helper"
RSpec.describe 'animalモデル機能', type: :model do
  context '動物の写真が空の場合' do
    it 'バリデーションにひっかる' do
      animal = Animal.new(pet_type:"猫",pet_name:"ミー",sex:"オス",age:"0~3ヶ月",vaccinated:"済み",spayed_neutered:"済み",note:"よろしく",prefecture:"東京都")
      expect(animal).not_to be_valid
    end
  end

  context '動物の種類が空の場合' do
    before do
      @animal = FactoryBot.build(:animal_dog)
      image = fixture_file_upload("spec/factories/dog.jpg")
      @animal.images.attach(image)
    end
    it 'バリデーションにひっかる' do
      animal = Animal.new(
        pet_type: [],
        pet_name: @animal.pet_name,
        sex: @animal.sex,
        age: @animal.age,
        vaccinated: @animal.vaccinated,
        spayed_neutered: @animal.spayed_neutered,
        note:  @animal.note,
        prefecture: @animal.prefecture
      )
      animal.images.attach(@animal.images.blobs)
      expect(animal).not_to be_valid
    end
  end

  context '動物の性別が空の場合' do
    before do
      @animal = FactoryBot.build(:animal_dog)
      image = fixture_file_upload("spec/factories/dog.jpg")
      @animal.images.attach(image)
    end
    it 'バリデーションにひっかる' do
      animal = Animal.new(
        pet_type: @animal.pet_type,
        pet_name: @animal.pet_name,
        sex: [],
        age: @animal.age,
        vaccinated: @animal.vaccinated,
        spayed_neutered: @animal.spayed_neutered,
        note:  @animal.note,
        prefecture: @animal.prefecture
      )
      animal.images.attach(@animal.images.blobs)
      expect(animal).not_to be_valid
    end
  end

  context '動物の備考が空の場合' do
    before do
      @animal = FactoryBot.build(:animal_dog)
      image = fixture_file_upload("spec/factories/dog.jpg")
      @animal.images.attach(image)
    end
    it 'バリデーションにひっかる' do
      animal = Animal.new(
        pet_type: @animal.pet_type,
        pet_name: @animal.pet_name,
        sex: @animal.sex,
        age: @animal.age,
        vaccinated: @animal.vaccinated,
        spayed_neutered: @animal.spayed_neutered,
        note:  [],
        prefecture: @animal.prefecture
      )
      animal.images.attach(@animal.images.blobs)
      expect(animal).not_to be_valid
    end
  end

  context '動物の年齢が空の場合' do
    before do
      @animal = FactoryBot.build(:animal_dog)
      image = fixture_file_upload("spec/factories/dog.jpg")
      @animal.images.attach(image)
    end
    it 'バリデーションにひっかる' do
      animal = Animal.new(
        pet_type: @animal.pet_type,
        pet_name: @animal.pet_name,
        sex: @animal.sex,
        age: [],
        vaccinated: @animal.vaccinated,
        spayed_neutered: @animal.spayed_neutered,
        note:  @animal.note,
        prefecture: @animal.prefecture
      )
      animal.images.attach(@animal.images.blobs)
      expect(animal).not_to be_valid
    end
  end

  
end