# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#clear the table before we seed
Pokemon.destroy_all

json = ActiveSupport::JSON.decode(File.read('db/pokedex.json'))

json['pokemon'].each do |item|
  new_pokemon = Pokemon.new  
  new_pokemon.num = item['num']
  new_pokemon.name = item['name']
  new_pokemon.img = item['img']
  new_pokemon.height = item['height']
  new_pokemon.weight = item['weight']
  new_pokemon.candy = item['candy']
  new_pokemon.candy_count = item['candy_count']
  new_pokemon.egg = item['egg']
  new_pokemon.avg_spawns = item['avg_spawns']
  new_pokemon.spawn_time = item['spawn_time']
  new_pokemon.save
end