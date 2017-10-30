# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('db', 'stops_data.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')

csv.each do |row|
  t = Stop.new
  t.miles_from_ga = row['miles_from_ga']
  t.to_next_point = row['to_next_point']
  t.name = row['name']
  t.town_access = row['town_access']
  t.elevation = row['elevation']
  t.miles_from_k = row['miles_from_k']
  t.save
  puts "#{t.miles_from_ga} - #{t.name} saved"
end

puts "There are now #{Stop.count} rows in the stop table"
