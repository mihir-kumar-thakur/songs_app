class Service::Storage::Pcloud
  attr_accessor :access_token
  PARENT_FOLDER_ID = 708235635

  def initialize
    @access_token = 'XEfdZ0vtAVEqVk00ZAiLc67Zs3NBtTeHaWyOUxKzVh1QEfAfpfFk'
  end

  def get_file_publink(file_id)
    api_url  = "https://api.pcloud.com/getfilepublink"
    response = JSON.parse(RestClient.get(api_url, { params: { access_token: access_token, fileid: file_id }}))
    "https://api.pcloud.com/getpublinkdownload?code=#{response['code']}"
  end

  def get_publink_download(file_id)
    response = JSON.parse(RestClient.get(get_file_publink(file_id)))
    "https://#{response['hosts'][0]}#{response['path']}"
  end

  def create_folder(name)
    api_url = "https://api.pcloud.com/createfolder"
    response = JSON.parse(RestClient.get(api_url,
      { params: { access_token: access_token, folderid: PARENT_FOLDER_ID, name: name } }))
    response["metadata"]["folderid"]
  end
end

