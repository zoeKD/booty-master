class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :name
      t.text :description
      t.string :url
      t.integer :intensity
      t.references :user, foreign_key: true
      t.integer :views
      t.time :duration

      t.timestamps
    end
  end
end
