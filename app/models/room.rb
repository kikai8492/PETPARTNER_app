class Room < ApplicationRecord
  # belongs_to :user
  belongs_to :animal
  has_many :trading_evaluations, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :chats, dependent: :destroy
end
