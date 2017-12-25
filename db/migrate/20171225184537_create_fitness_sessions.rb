class CreateFitnessSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :fitness_sessions do |t|
      t.references :user, foreign_key: true
      t.references :video, foreign_key: true
      t.date :done_at
      t.text :comment
      t.string :state
      t.references :workout, foreign_key: true

      t.timestamps
    end
  end
end
