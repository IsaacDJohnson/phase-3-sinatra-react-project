class Comic < ActiveRecord::Base
  has_many :reviews

  def self.comic_delete(id)
    Comic.find(id).destroy
  end

  def self.find_comic_with_id(id)
    Comic.find_by(id)
  end  
 
end