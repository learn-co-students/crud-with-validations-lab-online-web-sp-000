class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :title, null: false
      t.boolean :released, default: false
      t.integer :release_year
      t.string :artist_name, null: false
      t.string :genre

      t.timestamps null: false
    end
  end
end
