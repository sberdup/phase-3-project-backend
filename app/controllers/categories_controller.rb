class CategoriesController < ApplicationController

    get '/category/:category' do
        #all entries belonging to selected category
        if params[:category] == 'creature'
            food = Category.find(1).entities
            non_food = Category.find(2).entities
            return (food + non_food).to_json
        end
        category = Category.find_by(name:params[:category])
        category.entities.to_json
    end 

    get '/categories' do
        list = Category.all
        list.map{|category| category.name}.to_json
    end
end