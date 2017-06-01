class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :file_name
      t.integer :album_id
      t.integer :genre_id
      t.boolean :active, default: true
      t.string :thumb

      t.timestamps
    end
  end
end
