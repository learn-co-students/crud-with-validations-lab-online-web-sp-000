class AddArtistNameAndGenreToSongs < ActiveRecord::Migration[5.0]
  def change
    add_column :songs, :artist_name, :string
    add_column :songs, :genre, :string
  end
end
