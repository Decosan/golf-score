class Course < ApplicationRecord
  has_many :scores
  
  def self.search(search)
    if search
      where("name LIKE ?","%#{search}%")
    else
      all.order("alphabet ASC")
    end
  end
end
