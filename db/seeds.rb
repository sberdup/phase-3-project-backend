# require 'open-uri'
# require 'net-http'
# require 'json'

puts "🌱 Seeding spices..."

uri = URI.parse('https://botw-compendium.herokuapp.com/api/v2/all')
response = Net::HTTP.get_response(uri)
hc_hash = JSON.parse(response.body)


puts "✅ Done seeding!"
