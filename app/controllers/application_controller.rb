class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here

  get '/' do
    "Comic API
    use endpoints: 
    /comics for list of comics with IDs
    /reviews for list of reviews with IDs"
  end

  get "/comics" do
    Comic.all.to_json(include: :reviews)
  end

  get "/comics/:id" do
    Comic.find_comic_with_id(params[:id]).to_json(include: :reviews) 
  end

  get "/comics/:id/:reviews" do
    comic = Comic.find(params[:id])
    reviews = comic.reviews
    reviews.to_json  
  end

  get "/reviews" do
    Review.all.to_json
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
    comics = Comic.comic_delete(params[:id])
    comics.to_json
  end

  delete "/reviews/:id" do
    reviews = Review.delete_by_id(params[:id])
    reviews.to_json
  end

  patch "/reviews/:id" do
    comic = Comic.find(params[:comic_id])
    review = comic.reviews.find(params[:id])
    review.update(
      body: params[:body],
      rating: params[:rating],
    ) 
    review.to_json
  end

end
