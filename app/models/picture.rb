class Picture < ApplicationRecord
  mount_uploader :image2, Image2Uploader
  belongs_to :score, optional: true
end
