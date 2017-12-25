class FitnessSession < ApplicationRecord
  belongs_to :user
  belongs_to :video
  belongs_to :workout
  validates :date, :video, :user, presence: :true
end
