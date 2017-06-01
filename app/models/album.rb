class Album < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :artist
  has_many :songs

  after_create :create_folder_on_pcloud

  private
    def create_folder_on_pcloud
      access_token = 'XEfdZ0vtAVEqVk00ZAiLc67Zs3NBtTeHaWyOUxKzVh1QEfAfpfFk'
      create_folder_api = "https://api.pcloud.com/createfolder?access_token=#{access_token}&folderid=696261932&name=#{name}"
      response = JSON.parse(RestClient.get(create_folder_api))
      folder_id = response["metadata"]["folderid"]
      update_columns(directory: folder_id)
    end
end
