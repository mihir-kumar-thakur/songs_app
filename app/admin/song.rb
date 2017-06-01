ActiveAdmin.register Song do
  permit_params :name, :file_name, :album_id, :genre_id, :active, :thumb, :pcloud_file_no

  form do |f|
   f.inputs do
     f.input :name, :input_html => {:readonly => true}
     f.input :album
     f.input :genre
     f.input :thumb
     f.input :file_name, :input_html => {:readonly => true}
     f.input :active
     f.input :pcloud_file_no, :input_html => {:readonly => true}
     f.input :upload_to_pcloud, as: :file
   end
   f.actions
  end
end
