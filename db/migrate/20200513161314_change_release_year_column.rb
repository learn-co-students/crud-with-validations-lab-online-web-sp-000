class ChangeReleaseYearColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :songs, :release_year, :integer, :null => true
  end
end
