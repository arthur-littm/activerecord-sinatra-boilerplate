require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

get "/" do
  @restaurants = Restaurant.all
  erb :home
end

get "/restaurants/create" do
  restaurant = Restaurant.new(
    name: params[:restaurant_name],
    address: params[:restaurant_address]
  )
  restaurant.save
  redirect "/"
end

get '/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id])
  erb :show
end




# 1. first add the table restaurants (name, address, rating)
# 2. create model Restaurant (inheriting from AR)
# 3. seed the DB with 3 restaurant
