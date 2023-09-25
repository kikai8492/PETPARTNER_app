class FavoritesController < ApplicationController
  def create
    @animal = Animal.find(params[:animal_id])
    if @animal.user != current_user && user_signed_in?
      # @favorite = Favorite.create(user_id: current_user.id, animal_id: @animal.id)
      Favorite.create(user_id: current_user.id, animal_id: @animal.id)
      redirect_to animal_path(@animal), notice: "お気に入りに登録しました"
    end
  end

  def destroy
    @animal = Animal.find(params[:animal_id])
    Favorite.find_by(user_id: current_user.id, animal_id: @animal.id).destroy
    redirect_to animal_path(@animal), notice: "お気に入りから削除しました"
  end

  def show
    favorites = Favorite.where(user_id: current_user.id).pluck(:animal_id)
    @favorite_list = Animal.find(favorites)
  end
end
