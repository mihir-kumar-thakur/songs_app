class Genre < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :songs
end
