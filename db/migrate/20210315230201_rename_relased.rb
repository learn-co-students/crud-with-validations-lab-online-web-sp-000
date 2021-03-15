class RenameRelased < ActiveRecord::Migration[5.0]
  def change
      rename_column :songs, :relased, :released
  end
end
