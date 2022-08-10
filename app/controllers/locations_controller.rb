class LocationsController < ApplicationController

    get '/location/:location' do
        #location name will have to use spaces with '%20' e.g. /location/West%20Necluda
        location = Location.find_by(name:params[:location])
        location.entities.to_json
    end

    get '/locations' do
        list = Location.all
        list.map{|category| category.name}.to_json
    end
end