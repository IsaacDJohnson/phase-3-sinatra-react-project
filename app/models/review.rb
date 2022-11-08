class Review < ActiveRecord::Base
    belongs_to :comic

    def self.by_rating
      self.all.order(rating: :desc)
    end
    
  end