class TradingEvaluation < ApplicationRecord
  belongs_to :room
  
  validates :feedback, presence: true
  validates :score, presence: true
  validates :get_animal, presence: true
end
