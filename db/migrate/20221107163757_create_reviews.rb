class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :body
      t.string :rating
      t.integer :comic_id
      t.timestamps
    end
  end
end
