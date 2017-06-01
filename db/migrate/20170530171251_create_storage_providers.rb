class CreateStorageProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :storage_providers do |t|
      t.string :name
      t.string :access_token

      t.timestamps
    end
  end
end
