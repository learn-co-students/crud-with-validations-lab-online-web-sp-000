class AddIndexToSongs < ActiveRecord::Migration[5.0]
    def change
      add_index :songs, [:title, :release_year], unique: true
    end
  end