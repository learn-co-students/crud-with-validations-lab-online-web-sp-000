class ChangeNameToTitle < ActiveRecord::Migration[5.0]
  def change
    rename_column :songs, :name, :title
  end
end
