class Album < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :artist
  has_many :songs

  after_create :create_folder_on_pcloud

  private
    def create_folder_on_pcloud
      folder_id = Service::Storage::Pcloud.new.create_folder(name)
      update_columns(folder_id: folder_id)
    end
end
