class RemoveCreatedAtFromSongs < ActiveRecord::Migration[5.0]
  def change
    remove_column :songs, :created_at, :datetime
  end
end
