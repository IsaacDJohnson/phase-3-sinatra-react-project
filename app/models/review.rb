class Review < ActiveRecord::Base
    belongs_to :comic

    def self.delete_by_id(id)
      Review.find(id).destroy
    end

  end