class ChangeColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :songs, :released, :boolean, null: false, default: false 
  end
end
