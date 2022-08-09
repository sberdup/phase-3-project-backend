require 'open-uri'
require 'net-http'
require 'json
'
puts "🌱 Seeding spices..."

uri = URI.parse('https://botw-compendium.herokuapp.com/api/v2/categories/creatures')
response = Net::HTTP.get_response(uri)
creatures = JSON.parse(response.body)

p creatures

puts "✅ Done seeding!"
