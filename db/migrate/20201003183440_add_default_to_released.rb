class AddDefaultToReleased < ActiveRecord::Migration[5.0]
  def change
    change_column :songs, :released, :boolean, default: false, null: false
  end
end
