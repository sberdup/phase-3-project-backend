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

# Helper function creating entity_locations 
def entity_map(db_entity, entity_data)
    return if entity_data['common_locations'] == nil
    entity_data['common_locations'].each do |location|
        db_location = Location.find_by(name:location)
        EntityLocation.create(entity_id:db_entity.id, location_id:db_location.id)
    end
end

# Creating entities
hc_creatures_food.each do |entity|
    new_ent = Entity.create(
        category_id:1,
        cooking_effect:entity['cooking_effect'],
        description:entity['description'],
        hearts_recovered:entity['hearts_recovered'],
        image:entity['image'],
        name:entity['name'],
        logged:false 
    )
    entity_map(new_ent, entity)
end
hc_creatures_non_food.each do |entity|
    new_ent = Entity.create(
        category_id:2,
        drops:entity['drops'] == nil ? 'none' : entity['drops'].join(', '),
        description:entity['description'],
        image:entity['image'],
        name:entity['name'], 
        logged:false 
    )
    entity_map(new_ent, entity)
end
hc_monsters.each do |entity|
    new_ent = Entity.create(
        category_id:3,
        drops:entity['drops'] == nil ? 'none' : entity['drops'].join(', '),
        description:entity['description'],
        image:entity['image'],
        name:entity['name'],
        logged:false 
    )
    entity_map(new_ent, entity)
end
hc_equipment.each do |entity|
    new_ent = Entity.create(
        category_id:4,
        attack:entity['attack'],
        defense:entity['defense'],
        description:entity['description'],
        image:entity['image'],
        name:entity['name'],
        logged:false 
    )
    entity_map(new_ent, entity)
end
hc_materials.each do |entity|
    new_ent = Entity.create(
        category_id:5,
        cooking_effect:entity['cooking_effect'],
        hearts_recovered:entity['hearts_recovered'],
        description:entity['description'],
        image:entity['image'],
        name:entity['name'],
        logged:false 
    )
    entity_map(new_ent, entity)
end
hc_treasure.each do |entity|
    new_ent = Entity.create(
        category_id:6,
        drops:entity['drops'] == nil ? 'none' : entity['drops'].join(', '),
        description:entity['description'],
        image:entity['image'],
        name:entity['name'],
        logged:false 
    )
    entity_map(new_ent, entity)
end
puts "✅ Done seeding!"
