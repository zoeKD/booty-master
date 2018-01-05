class CreateVideoWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :video_workouts do |t|
      t.references :video, foreign_key: true
      t.references :workout, foreign_key: true
      t.integer :order

      t.timestamps
    end
  end
end
