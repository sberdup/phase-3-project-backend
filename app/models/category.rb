class Category < ActiveRecord::Base
    has_many :entities
end