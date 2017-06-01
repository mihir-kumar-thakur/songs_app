class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.string :name
      t.integer :artist_id
      t.string :picture
      t.string :directory
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
