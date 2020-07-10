class CreateSongsTable<ActiveRecord::Migration 

    def change
        create_table :songs do |t|
        t.string :title
        t.string :artist_name
        t.integer :release_year
        t.boolean :released
        t.string :artist_name
        t.string :genre
        
        t.datetime :created_at, null: "false"
        t.datetime :updated_at, null: "false"
        end
    end 

end 