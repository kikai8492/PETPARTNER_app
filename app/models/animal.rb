class Animal < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  
  validates :pet_type, presence: true
  validates :pet_name, presence: true, length: { minimum:1, maximum: 255 }
  validates :sex, presence: true
  validates :age, presence: true
  validates :vaccinated, presence: true
  validates :spayed_neutered, presence: true
  validates :prefecture, presence: true
  validates :note, presence: true
  validates :trading_status, presence: true
  validates :images, presence: true
  has_many_attached :images

  validate :images_max_length
  validate :images_min_length

  private

  def images_max_length
    if images.length >= 10
      images.purge
      errors.add(:images, "添付する画像は10枚以内にしてください")
    end
  end

  def images_min_length
    if images.length < 1
      images.purge
      errors.add(:images, "添付する画像は最低1枚必要です")
    end
  end
end
