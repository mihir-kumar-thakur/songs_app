ActiveAdmin.register Artist do
  permit_params :name, :bio, :picture, :active
end
