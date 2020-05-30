class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :string
      t.string :released
      t.string :boolean
      t.string :release_year
      t.string :integer
      t.string :artist_name
      t.string :string
      t.string :genre
      t.string :string

      t.timestamps
    end
  end
end
