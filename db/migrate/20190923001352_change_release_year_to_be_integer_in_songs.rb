class ChangeReleaseYearToBeIntegerInSongs < ActiveRecord::Migration[5.0]
  def change
    change_column :songs, :release_year, :integer
  end
end
