class Animal < ApplicationRecord
  belongs_to :user
  belongs_to :room, optional: true
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many_attached :images
  
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

  validate :images_max_length
  validate :images_min_length

  scope :animals, -> {
    where(trading_status: 0)
  }

  scope :pet_type, -> (pet_type){
    where(pet_type: pet_type) 
  }

  scope :vaccinated, -> (vaccinated) {
    where(vaccinated: vaccinated) 
  } 

  scope :spayed_neutered, -> (spayed_neutered) {  
    where(spayed_neutered: spayed_neutered)
  }

  scope :sex, -> (sex) {
    where(sex: sex)
  }

  scope :age, -> (age) {
    where(age: age)
  }

  scope :prefecture, -> (prefecture) {
    where(prefecture: prefecture)
  }

  private

  def images_max_length
    if images.length > 10
      errors.add(:images, "は10枚以内にしてください")
    end
  end
  
  def images_min_length
    if images.length < 1
      errors.add(:images, "は最低1枚必要です")
    end
  end
end
