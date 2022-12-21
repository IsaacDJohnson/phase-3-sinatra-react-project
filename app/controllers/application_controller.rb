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

  get "/comics/:id/:reviews" do
    comic = Comic.find(params[:id])
    reviews = comic.reviews
    reviews.to_json  
  end

  get "/reviews" do
    review = Review.all
    review.to_json
  end

  get "/reviews/:comic_id" do
    review = Review.find(params[:comic_id])
    review.to_json
  end

  post "/reviews" do 
    comic = Comic.find(params[:comic_id])
    review = comic.reviews.create(
      body: params[:body],
      rating: params[:rating],
    )
    review.to_json  
  end

  post "/comics" do
    comic = Comic.create(
      name: params[:name],
      reviews: params[:reviews]
    )
    comic.to_json
  end

  delete "/comics/:id" do
    comics = Comic.find(params[:id])
    comics.destroy
    comics.to_json
  end

  delete "/reviews/:id" do
    reviews = Review.find(params[:id])
    reviews.destroy
    reviews.to_json
  end

  patch "/reviews/:id" do
    comic = Comic.find(params[:comic_id])
    review = comic.reviews.find(params[:id])
    review.update(
      body: params[:body],
      rating: params[:rating],
    ) 
    reviews.to_json
  end

end
