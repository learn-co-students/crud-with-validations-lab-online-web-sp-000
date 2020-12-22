class AddArtistYearToSongs < ActiveRecord::Migration[5.0]
  def change
    add_column :songs, :artist_year, :string
  end
end
