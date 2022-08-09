class Entity < ActiveRecord::Base
    belongs_to :category
    has_many :entity_locations
    has_many :locations, through: :entity_locations
end