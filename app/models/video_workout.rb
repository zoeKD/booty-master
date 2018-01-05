class VideoWorkout < ApplicationRecord
  belongs_to :video
  belongs_to :workout
end
