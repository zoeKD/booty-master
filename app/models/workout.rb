class Workout < ApplicationRecord
  belongs_to :user
  validates :name, :intensity, :workout_duration, presence: :true
  has_many :video_workouts
  has_many :videos, through: :video_workouts
end
