class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/" do
    'No data here!'.to_json
  end

  get '/all' do
    Entity.all.to_json
  end
  
  get '/category/:category' do
    category = Category.find_by(name:params[:category].to_s)
    category.entities.to_json
  end 
end
