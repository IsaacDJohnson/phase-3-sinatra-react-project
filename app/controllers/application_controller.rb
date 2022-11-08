class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here

  get '/' do
    "Comic API
    use endpoints: 
    /comics for list of comics with IDs
    /reviews for list of reviews with IDs and ratings at by_rating"
  end

  get "/comics" do
    comics = Comic.all
    comics.to_json(include: :reviews)
  end

  get "/comics/:id" do
    comic = Comic.find(params[:id])
    comic.to_json(include: :reviews) 
  end

  get "/reviews" do
    review = Review.all
    review.to_json
  end

  get "/reviews/:id" do
    review = Review.find(params[:id])
    review.to_json
  end

  get "/reviews/by_rating" do
    reviews = Reviews.by_rating
    reviews.to_json
  end

  post '/reviews' do 
    reviews = Review.create(
      body: params[:body],
      rating: params[:rating],
      comic_id: params[:comic_id]
    )
    reviews.to_json
  end

  delete "/reviews/:id" do
    reviews = Review.find(params[:id])
    reviews.destroy
    reviews.to_json
  end

  patch "/reviews/:id" do
    reviews = Review.find(params[:id])
    reviews.update(
      body: params[:body],
      rating: params[:rating]
    ) 
    reviews.to_json
  end

end
