class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.text :bio
      t.string :picture
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
