class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :songs, :release_yea, :release_year
  end
end
