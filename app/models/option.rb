class Option < ApplicationRecord
  belongs_to :user

  validates :answer1, presence: true
  validates :answer2, presence: true
  validates :answer3, presence: true
  validates :answer4, presence: true
  validates :answer5, presence: true
  validates :answer6, presence: true
  validates :answer7, presence: true
  validates :answer8, presence: true
  validates :answer9, presence: true
  validates :answer10, presence: true


  scope :recent, -> {
    order(created_at: :desc)
  }

  scope :answer1_avg, -> { 
    average(:answer1) 
  }

  scope :answer2_avg, -> {
    average(:answer2)
  }

  scope :answer3_avg, -> {
    average(:answer3)
  }

  scope :answer4_avg, -> {
    average(:answer4)
  }

  scope :answer5_avg, -> {
    average(:answer5)
  }

  scope :answer6_avg, -> {
    average(:answer6)
  }

  scope :answer7_avg, -> {
    average(:answer7)
  }

  scope :answer8_avg, -> {
    average(:answer8)
  }

  scope :answer9_avg, -> {
    average(:answer9)
  }

  scope :answer10_avg, -> {
    average(:answer10)
  }
end
