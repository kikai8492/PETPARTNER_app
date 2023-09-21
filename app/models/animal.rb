class Animal < ApplicationRecord
  validates :pet_type, presence: true
  validates :pet_name, presence: true, length: { minimum:1, maximum: 255 }
  valifates :sex, presence: true
  validates :age, presence: true
  validates :vaccinated, presence: true
  validates :spayed_neutered, presence: true
  validates :note, presence: true
  validates :trading_status, presence: true
end
