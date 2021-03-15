class RemoveUpdatedAtFromSongs < ActiveRecord::Migration[5.0]
  def change
    remove_column :songs, :updated_at, :datetime
  end
end
