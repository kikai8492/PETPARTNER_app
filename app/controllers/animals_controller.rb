class AnimalsController < ApplicationController

  def index
    @animals = Animal.where(trading_status: 0)

    #動物の種類で絞り込みの条件式を書く
    if params[:pet_type].present?
      @animals = @animals.where(pet_type: params[:pet_type])
    end

    # ワクチン接種の有無で絞り込み
    if params[:vaccinated].present?
      @animals = @animals.where(vaccinated: params[:vaccinated])
    end

    # 去勢手術の有無で絞り込み
    if params[:spayed_neutered].present?
      @animals = @animals.where(spayed_neutered: params[:spayed_neutered])
    end

    # 性別で絞り込み
    if params[:sex].present?
      @animals = @animals.where(sex: params[:sex])
    end

    # 年齢で絞り込み
    if params[:age].present?
      @animals = @animals.where(age: params[:age])
    end

    # 都道府県で絞り込み
    if params[:prefecture].present?
      @animals = @animals.where(prefecture: params[:prefecture])
    end

    #最終的な@animalsの結果をランダムに並び替え
    @animals = @animals.shuffle
  end

  def new
    if user_signed_in? 
      @animal = Animal.new
    else
      redirect_to animals_path, notice: "ログインしてください"
    end
  end

  def create
    @animal = current_user.animals.build(animal_params)
    if @animal.save
      redirect_to animals_path, notice: "登録しました"
    else
      render :new, notice: "登録に失敗しました"
    end
  end

  def show
    @animal = Animal.find(params[:id])

    @user = @animal.user
    @currentUserEntry = Entry.where(user: current_user)
    @userEntry = Entry.where(user_id: @user.id)
    # unless @user.id == current_user.id && @animal.trading_status == 1|| @animal.trading_status == 2
    # if @user.id == current_user.id && @animal.trading_status == 1|| @animal.trading_status == 2
    if user_signed_in? && (@animal.trading_status == 1|| @animal.trading_status == 2)
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
    end
    unless @isRoom
      @room = Room.new
      @entry = Entry.new
    end
  end

  def start_chat
    @animal = Animal.find(params[:id])

    if Room.find_by(animal_id: @animal.id).nil?

      # お気に入り登録せずに応募するを押してチャットを開始する場合、強制的にお気に入り登録を行う
      favorite = Favorite.find_or_initialize_by(user_id: current_user.id, animal_id: @animal.id)

      unless favorite.persisted? # すでにお気に入り登録されているか確認
        favorite.save
        flash[:favorite] = "お気に入りに登録しました"
      end

      @animal.update(trading_status: 1)

      #その他のチャットルーム作成やエントリー作成などの処理をここに記述
      @room = Room.new(animal_id: @animal.id)

      @room.save
      # エントリーの作成
      @entry1 = Entry.new(user_id: current_user.id, room_id: @room.id)
      @entry2 = Entry.new(user_id: @animal.user.id, room_id: @room.id)
      @entry1.save
      @entry2.save
      redirect_to room_path(@room.id), notice: "チャットを開始しました"
    else
      redirect_to animal_path(@animal), notice: "現在、他のユーザが問い合わせ中のためチャットを開始できません"
    end
  end

  def destroy_chat
    @animal = Animal.find(params[:id])
    
    if current_user != @animal.user
      redirect_to animals_path, notice: "飼い主しか取引は中止できません"
      return
    end

    room = Room.find_by(animal_id: @animal.id)
    room.destroy

    @animal.update(trading_status: 0)
    redirect_to animals_path, notice: "取引を中止しました"
  end

  def edit
    @animal = Animal.find(params[:id])
    if @animal.user != current_user
      redirect_to animals_path, notice: "他人の掲載情報は編集できません"
    end
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update(animal_params)
      redirect_to animals_path, notice: "動物の情報を更新しました"
    else
      render :edit, notice: "更新に失敗しました"
    end
  end

  def destroy
    @animal = Animal.find(params[:id])
    if @animal.destroy
      redirect_to animals_path, notice: "動物の情報を削除しました"
    else
      render :show, notice: "削除に失敗しました"
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:pet_type, :pet_name, :sex, :age, :vaccinated, :spayed_neutered, :note, :trading_status, :prefecture, images:[])
  end
end
