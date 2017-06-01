class Song < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :album
  belongs_to :genre

  validates :name, :file_name, :album, :genre, :active, :pcloud_file_no, presence: true
  after_save :fetch_url_from_pcloud

  private
    def fetch_url_from_pcloud
      access_token = 'XEfdZ0vtAVEqVk00ZAiLc67Zs3NBtTeHaWyOUxKzVh1QEfAfpfFk'
      public_link_uri = "https://api.pcloud.com/getfilepublink?access_token=#{access_token}&fileid=#{pcloud_file_no}"
      get_code = JSON.parse(RestClient.get(public_link_uri))
      public_download = "https://api.pcloud.com/getpublinkdownload?code=#{get_code['code']}"
      download_res = JSON.parse(RestClient.get(public_download))
      download_link = "https://#{download_res['hosts'][0]}#{download_res['path']}"
      update_columns(file_url: download_link.to_s)
    end
end
