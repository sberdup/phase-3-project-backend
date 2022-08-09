class EntityLocation < ActiveRecord::Base
    belongs_to :entity
    belongs_to :location
end