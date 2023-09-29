class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :animals, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  
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

  # def coordinates
  #   results = Geocoder.search(full_address)
  #   if results.present?
  #     lat = results.first.latitude
  #     lon = results.first.longitude
  #     { latitude: lat, longitude: lon }
  #   else
  #     nil
  #   end
  # end

  # def full_address
  #   [postal_code, prefecture, municipality, street_address].compact.join(', ')
  # end
end
