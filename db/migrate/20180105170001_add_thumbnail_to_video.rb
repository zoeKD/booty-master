class AddThumbnailToVideo < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :thumbnail, :string
  end
end
