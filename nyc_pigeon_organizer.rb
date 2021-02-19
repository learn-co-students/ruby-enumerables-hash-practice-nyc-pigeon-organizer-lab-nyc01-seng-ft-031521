require 'pry'

def nyc_pigeon_organizer(data)
  pigeon_name_hash = {}
  color_hash = data.dig(:color) 
  names_array = color_hash.values
  names_array = names_array.flatten.uniq 
  names_array.map do |elem| pigeon_name_hash[elem] = {color: [], gender: [], lives: []} end
  colors_array = data[:color].keys 
  gender_array = data[:gender].keys
  lives_array = data[:lives].keys
  
  name = 0 
  while name < names_array.length do 
    color = 0 
    while color < colors_array.length do
      if data[:color][colors_array[color]].include?(names_array[name])
        pigeon_name_hash[names_array[name]][:color].append(colors_array[color].to_s)
      end 
      color += 1
    end 
    name += 1
  end 
  
  name = 0 
  while name < names_array.length do 
    gender = 0 
    while gender < gender_array.length do
      if data[:gender][gender_array[gender]].include?(names_array[name])
        pigeon_name_hash[names_array[name]][:gender].append(gender_array[gender].to_s)
      end
      gender += 1 
    end
    name += 1 
  end
  
  name = 0 
  while name < names_array.length do 
    lives = 0 
    while lives < lives_array.length do
      if data[:lives][lives_array[lives]].include?(names_array[name])
        pigeon_name_hash[names_array[name]][:lives].append(lives_array[lives].to_s)
      end
      lives += 1 
    end
    name += 1 
  end
  pigeon_name_hash
end
