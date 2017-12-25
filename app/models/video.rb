class Video < ApplicationRecord
  belongs_to :user
  validates :url, presence: :true, uniqueness: true
  validates :name, :intensity, :duration, presence: :true
  has_many :video_workouts
  has_many :workouts, through: :video_workouts
  acts_as_taggable
end
