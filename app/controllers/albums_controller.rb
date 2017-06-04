class AlbumsController < ActionController::Base

  def index
    render json: Album.all
  end

  def fetch_folder_id
    album = Album.find(params[:album_id])
    render json: { folder_id: album.folder_id }
  end
end
