class AddFileUrlToSong < ActiveRecord::Migration[5.0]
  def change
    add_column :songs, :file_url, :string
  end
end
