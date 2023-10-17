class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :animals, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # has_many :messages, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :entries, dependent: :destroy

  has_many :options, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :icon, presence: true
  mount_uploader :icon, ImageUploader
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :nick_name, presence: true
  validates :phone_number, presence: true, uniqueness: true
  validates :postal_code, presence: true
  validates :prefecture, presence: true
  validates :municipality, presence: true
  validates :street_address, presence: true
  validates :movable_range, presence: true
  validates :sex, presence: true
  validates :occupation, presence: true
  validates :self_introduction, presence: true
  validates :terms_of_use, presence: true

  # 以下のように定義することで、animals/showでユーザーがお気に入り登録した動物を取得できるようになる。
  def favorited_by?(animal_id)
    favorites.where(animal_id: animal_id).exists?
  end

  def actual_movable_distance
    if movable_range == 0
      50
    elsif movable_range == 1
      100
    elsif movable_range == 2
      200
    else
      Float::INFINITY
    end
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = "aaaaaa"
      user.icon = "download-2.jpg"
      user.last_name = "ゲスト"
      user.first_name = "ユーザー"
      user.nick_name = "ゲストユーザー"
      user.phone_number = "1010101"
      user.postal_code = "0000000"
      user.prefecture = "東京都"
      user.municipality = "渋谷区"
      user.street_address = "渋谷"
      user.movable_range = 1
      user.sex = "男"
      user.occupation = "会社員"
      user.self_introduction = "ゲストユーザーです。よろしくお願いします"
      user.terms_of_use = "利用規約に同意しました"
      user.password_confirmation = user.password
      # user.name = "ゲストユーザー"
    end
  end

  def self.admin
    find_or_create_by!(email: 'admin@example.com') do |user|
      user.password = "aaaaaa"
      user.icon = "download-2.jpg"
      user.last_name = "管理者"
      user.first_name = "ユーザー"
      user.nick_name = "管理者ユーザー"
      user.phone_number = "0101010"
      user.postal_code = "0000000"
      user.prefecture = "東京都"
      user.municipality = "渋谷区"
      user.street_address = "渋谷"
      user.movable_range = 1
      user.sex = "男"
      user.occupation = "会社員"
      user.self_introduction = "管理者ユーザーです。よろしくお願いします"
      user.terms_of_use = "利用規約に同意しました"
      user.password_confirmation = user.password
      user.admin = true
      # user.name = "ゲストユーザー"
    end
  end
end
