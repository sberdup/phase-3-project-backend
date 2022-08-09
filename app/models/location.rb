class Location < ActiveRecord::Base
    has_many :entity_locations
    has_many :entities, through: :entity_locations
end