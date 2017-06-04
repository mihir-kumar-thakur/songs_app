class Song < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :album
  belongs_to :genre

  validates :name, :file_name, :album, :genre, :pcloud_file_no, presence: true
  after_save :fetch_url_from_pcloud

  private
    def fetch_url_from_pcloud
      if pcloud_file_no_changed?
        public_download_link = Service::Storage::Pcloud.new.get_publink_download(pcloud_file_no)
        update_columns(file_url: public_download_link)
      end
    end
end
