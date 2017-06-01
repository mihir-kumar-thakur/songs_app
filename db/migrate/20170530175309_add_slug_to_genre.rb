class AddSlugToGenre < ActiveRecord::Migration[5.0]
  def change
    add_column :genres, :slug, :string
    add_index :genres, :slug, unique: true
  end
end
