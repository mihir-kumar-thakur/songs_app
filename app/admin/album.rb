ActiveAdmin.register Album do
  permit_params :name, :artist_id, :picture, :directory, :active
end
