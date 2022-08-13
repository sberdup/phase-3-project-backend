class EntitiesController < ApplicationController

    get '/entries' do
        #gets all entries
        Entity.all.to_json
      end
      
    post '/entries' do
        #will need to create entity and take in location information to create entity_locations
        binding.pry
    end

    get '/entry/:id' do
        #gets specific entry
        Entity.find(params[:id].to_i).to_json
    end

    patch '/entry/:id' do
        #update simply flips existing logged value to track whether you've done so
        entity = Entity.find(params[:id].to_i)
        entity_update = !entity.logged
        entity.update(logged:entity_update)
        entity.to_json
    end 

    delete '/entry/:id' do
        entity = Entity.find(params[:id].to_i)
        entity.destroy
        'delete success'.to_json
    end 

    get '/entry/:id/locations' do
        #returns an array of locations where the entry can be found
        locations = Entity.find(params[:id].to_i).locations
        locations.map{|location| location['name']}.to_json
    end
end