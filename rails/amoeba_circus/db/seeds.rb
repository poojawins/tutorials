# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
amoebas = []
talents = []
acts = []

File.open('../public/talents.txt').each do |line|
  talents << Talent.create(name: line.chomp)
end

File.open('../public/amoebas.txt').each do |line|
  amoebas << Amoeba.create(name: line.chomp, generation: 1, talent_id: talent.sample.id
end

File.open('../public/acts.txt').each do |line|
  acts << Act.create(name: line.chomp, date: Date.now, time: Time.now)
end

10.times do
  Act
end