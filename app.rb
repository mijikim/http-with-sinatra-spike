require "sinatra/base"

class MyApp < Sinatra::Application

  def initialize
    super
    @items = ["ice cream", "milkshake", "pie"]
  end

  get "/" do
    "items length: #{@items.length}"
    erb :root
  end

  get "/items" do
    filter = params[:filter]
    @filtered_items = @items
    @filtered_items = @items.select {|x| x.include?(filter)} unless filter == nil
    erb :items
  end

  get "/items/new" do
    erb :new
  end

  get "/items/:id" do
    id = params[:id].to_i
    "You found item: #{@items[id]}"
  end

  run! if app_file == $0

end
