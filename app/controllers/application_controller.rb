class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/" do
    'No data here!'.to_json
  end

end
