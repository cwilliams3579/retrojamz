class Game < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  searchkick
end
