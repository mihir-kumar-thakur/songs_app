class AddFolderIdToAlbum < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :folder_id, :string
  end
end
