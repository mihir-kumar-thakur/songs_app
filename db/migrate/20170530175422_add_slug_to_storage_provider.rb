class AddSlugToStorageProvider < ActiveRecord::Migration[5.0]
  def change
    add_column :storage_providers, :slug, :string
    add_index :storage_providers, :slug, unique: true
  end
end
