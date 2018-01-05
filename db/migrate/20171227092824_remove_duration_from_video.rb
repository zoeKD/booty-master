class RemoveDurationFromVideo < ActiveRecord::Migration[5.1]
  def change
    remove_column :videos, :duration
    remove_column :workouts, :duration
  end
end
