class Review < ActiveRecord::Base
    belongs_to :comic

    def self.create_review(body, rating, comic_id)
      Review.create(body: body, rating: rating, comic_id: comic_id)
    end

    def self.delete_by_id
      Review.find(id).destroy
    end

    def self.update_review_body(body)
      Review.update(body: body)
    end

    def self.update_review_rating(rating)
      Review.update(rating)
    end

  end