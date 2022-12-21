class Comic < ActiveRecord::Base
  has_many :reviews

  def self.first_comic
    Comic.first
  end

  def self.find_comic_with_id
    Comic.find_by(id)
  end  

  def self.update_review(review)
    Comic.update(review: review)
  end
 
end