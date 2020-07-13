class ChangeRealeasedYearName < ActiveRecord::Migration[5.0]
  def change
    change_column :songs, :released_year, :release_year
  end
end
