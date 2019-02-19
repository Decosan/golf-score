class Score < ApplicationRecord
  
  belongs_to :user
  belongs_to :course
  belongs_to :category
  mount_uploader :image2, Image2Uploader
  
  validates :score_out, presence: true
  validates :score_in, presence: true
  validates :score_total, presence: true
  validates :put_out, presence: true
  validates :put_in, presence: true
  validates :put_total, presence: true
  validates :memo, length:{maximum: 255}
  
end
