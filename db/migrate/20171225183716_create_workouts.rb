class CreateWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :workouts do |t|
      t.string :name
      t.text :description
      t.string :url
      t.integer :intensity
      t.time :duration
      t.references :user, foreign_key: true
      t.integer :views
      t.time :duration

      t.timestamps
    end
  end
end
