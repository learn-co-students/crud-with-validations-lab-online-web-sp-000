class RemoveNameFromSongs < ActiveRecord::Migration[5.0]
  def change
    remove_column :songs, :name, :string
  end
end
