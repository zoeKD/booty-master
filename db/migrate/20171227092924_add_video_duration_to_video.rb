class AddVideoDurationToVideo < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :video_duration, :integer
    add_column :workouts, :workout_duration, :integer
  end
end
