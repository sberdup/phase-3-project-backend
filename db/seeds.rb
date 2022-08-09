# require 'open-uri'
# require 'net-http'
# require 'json'

puts "🌱 Seeding compendium..."

uri = URI.parse('https://botw-compendium.herokuapp.com/api/v2/all')
response = Net::HTTP.get_response(uri)
hc_hash = JSON.parse(response.body)['data']

#splitting all data into subcategories
hc_creatures_food = hc_hash['creatures']['food']
hc_creatures_non_food = hc_hash['creatures']['non_food']
hc_monsters = hc_hash['monsters']
hc_equipment = hc_hash['equipment']
hc_materials = hc_hash['materials']
hc_treasure = hc_hash['treasure']

# Creating categories
Category.create(name:'food_creature')
Category.create(name:'non_food_creature')
Category.create(name:'monster')
Category.create(name:'equipment')
Category.create(name:'material')
Category.create(name:'treasure')

# Pulling location data
locations = []
hc_creatures_food.each{|entry| locations << entry['common_locations']}
hc_creatures_non_food.each{|entry| locations << entry['common_locations']}
hc_monsters.each{|entry| locations << entry['common_locations']}
hc_equipment.each{|entry| locations << entry['common_locations']}
hc_materials.each{|entry| locations << entry['common_locations']}
hc_treasure.each{|entry| locations << entry['common_locations']}

# Creating locations
locations = locations.flatten.uniq.filter{|string| string != nil}
locations.each{|location| Location.create(name:location)}

# Helper function seeding entity_locations 
def entity_map(db_entity, entity_data)
    entity_data['common_locations'].each do |location|
        db_location = Location.find_by(name:location)
        EntityLocation.create(entity_id:db_entity.id, location_id:db_location.id)
    end
end

hc_creatures_food.each do |creature|
    new_ent = Entity.create(
        category_id:1,
        cooking_effect:creature['cooking_effect'],
        description:creature['description'],
        hearts_recovered:creature['hearts_recovered'],
        image:creature['image'],
        name:creature['name'] 
    )
    entity_map(new_ent, creature)
end

puts "✅ Done seeding!"
