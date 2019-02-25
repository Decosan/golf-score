class Score < ApplicationRecord
  
  belongs_to :user
  belongs_to :course
  belongs_to :category
  
  # mount_uploader :image3, Image2Uploader
  
  has_many :pictures
  accepts_nested_attributes_for :pictures
  
  validates :score_out, presence: true
  validates :score_in, presence: true
  validates :score_total, presence: true
  validates :put_out, presence: true
  validates :put_in, presence: true
  validates :put_total, presence: true
  validates :memo, length:{maximum: 255}
  
end
