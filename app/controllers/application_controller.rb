class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/bakeries' do
    # get all the games from the database
    bakery = Bakery.all.order(:title)
    # return a JSON response with an array of all the game data
    bakery.to_json
  end

  get '/bakeries/:id' do
    # look up the game in the database using its ID
    bakery = Bakery.find(params[:id])
    # send a JSON-formatted response of the game data
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    # look up the game in the database using its ID
    baked_goods = BakedGood.all.order(price: :desc)
    # send a JSON-formatted response of the game data
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    # look up the game in the database using its ID
    baked_goods = BakedGood.all.order(price: :desc).first
    # send a JSON-formatted response of the game data
    baked_goods.to_json
  end


end
