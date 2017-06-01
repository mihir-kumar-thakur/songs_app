class AddPcloudFileNoToSong < ActiveRecord::Migration[5.0]
  def change
    add_column :songs, :pcloud_file_no, :string
  end
end
