class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      redirect_to animals_path, notice: "登録しました"
    else
      render :new, notice: "登録に失敗しました"
    end
  end

  def show
    @animal = Animal.find(params[:id])
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    @ainmal = Animal.find(params[:id])
    if @animal.update(animal_params)
      redirect_to animals_path, notice: "動物の情報を更新しました"
    else
      render :edit, notice: "更新に失敗しました"
    end
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
  end
  private

  def animal_params
    params.require(:animal).permit(:pet_type, :pet_name, :sex, :age, :vaccinated, :spayed_neutered, :note, :trading_status, images:[])
  end
end
